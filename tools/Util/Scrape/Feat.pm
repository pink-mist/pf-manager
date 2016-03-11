package Util::Scrape::Feat {

	use Mojo::Base -base;

	use feature 'say';
	use open qw( :encoding(UTF-8) :std );

	use Mojo::Util qw/ slurp spurt encode decode /;
	use Mojo::UserAgent;
	use Try::Tiny;
	use Text::Fuzzy;
	use List::UtilsBy qw/ nsort_by uniq_by /;

	use Mojo::Pg;
	has pg => sub { Mojo::Pg->new('postgresql:///pathfinder'); };
	has scrapes => 0;

	sub indent {
		my ($indent, $text) = @_;
		return $text unless $indent;

		my @lines = split /\n/, $text;
		foreach my $line (@lines) {
			next unless length($line);
			$line = (" " x $indent) . $line;
		}
		return join "\n", @lines;
	}

	sub width {
		my ($width, $text) = @_;
		return $text unless $width;

		my @lines = split /\n/, $text;
		my @result;
		foreach my $line (@lines) {
			while (length($line) > $width) {
				push @result, substr $line, 0, $width, '';
			}
			push @result, $line;
		}
		return join "\n", @result;
	}

	sub show_usage {
		say <<"END";
$0 [options] feat
$0 -h

Options:
  -h|--help    Show this help
  -l|--list    Only list matching feats
  -o|--one     Only display the first match
  -r|--raw     Don't format the output
END
		return 1;
	}

	sub _filter {
		my $dom = shift;
		$dom->find(':not(a,b,ul,li)')->map('strip');
		return $dom->content();
	}

	sub get_feat {
		my ($self, $url, $name, $scraper) = @_;
		my ($page) = $url =~ m!/([^/]+)$!;

		# Default scraper
		$scraper //= sub {
			my ($url) = @_;
			if ( $self->scrapes++ > 3 ) { warn "Scraping too many pages at once."; return ''; }
			warn "Getting '$url'...\n";
			my $get = Mojo::UserAgent->new()->get($url)->res();
			warn "Error getting page\n" and return '' if ((not defined $get->code()) or $get->code() != 200);
			my ($div) = @{ $get->dom('div.sites-layout-name-two-column-hf.sites-layout-vbox') };
			warn $get->body() and return '' unless defined $div;
			my @elements = @{ $div->find('i, p, h1, h2, h3, h4, h5, ul')->map(sub { _filter($_) }); };
			my $body = join "\n\n", uniq_by { $_ } grep { /\S+/ } @elements;
			$body;
		};

		my ($types) = $name =~ /\s+\(([^()]+)\)$/;
		if (defined $types) {
			$name =~ s/\s+\([^()]+\)$//;
		}

		my $res = $self->pg->db->query("SELECT description FROM feats WHERE source = ?", $url);
		if ($res->rows() and defined( my $desc = $res->hash()->{description} ))  { return $desc; }

		warn "Feat $name not found in DB.\n";

		# Not found in DB, so let's see if it's in the cache, otherwise download it
		my $desc = try {
			decode 'UTF-8', slurp("feats/$page");
		} catch {
			my $body = $scraper->($url);
			spurt(encode('UTF-8', $body), "feats/$page") if length $body;
			$body;
		};
		if (length $desc) {
			warn "Inserting description into DB.\n";
			my $id = $self->pg->db->query("SELECT id FROM feats WHERE source = ?", $url);
			if ($id->rows()) {
				$self->pg->db->query("UPDATE feats SET description = ?, updated = DEFAULT WHERE id = ?", $desc, $id->hash->{id});
			} else {
				$self->pg->db->query("INSERT INTO feats (name, description, source) VALUES (?, ?, ?);", $name, $desc, $url);
				$self->add_types($name, $types) if defined $types;
			}
		}
		return $desc;
	}

	sub add_types {
		my ($self, $name, $types) = @_;
		my @types = split /, ?/, $types;
		my $fid = $self->get_feat_id($name);

		my @type_ids = map { $self->get_type($_) } @types;
		foreach my $tid (@type_ids) {
			next if $self->pg->db->query('SELECT feat FROM feats_rel_feat_types WHERE type = ? AND feat = ?;', $tid, $fid)->rows();
			$self->pg->db->query('INSERT INTO feats_rel_feat_types (type, feat) VALUES (?, ?);', $tid, $fid);
		}
	}

	sub get_feat_id {
		my ($self, $name) = @_;

		my $res = $self->pg->db->query('SELECT id FROM feats WHERE name = ?;', $name);
		return $res->hash->{id} if $res->rows;
		return undef;
	}

	sub get_type {
		my ($self, $type) = @_;
		my $res = $self->pg->db->query('SELECT id FROM feat_types WHERE name = ?;', $type);
		if ($res->rows()) { return $res->hash()->{id}; }

		return $self->pg->db->query('INSERT INTO feat_types (name) VALUES (?) RETURNING id;', $type)->hash()->{id};
	}

	sub get_feat_types {
		my ($self, $fid) = @_;
		my $res = $self->pg->db->query('SELECT type FROM feats_rel_feat_types WHERE feat = ?;', $fid);
		return map { $_->{id} } @{ $res->hashes };
	}

	sub get_feat_type_name {
		my ($self, $fid) = @_;
		my $res = $self->pg->db->query('SELECT name FROM feat_types, feats_rel_feat_types WHERE feats_rel_feat_types.type = feat_types.id AND feats_rel_feat_types.feat = ? ORDER BY name ASC', $fid);
		my $types = join ", ", map { $_->{name} } @{ $res->hashes };
		$types = " ($types)" if length $types;
		return $types;
	}

	sub get_list {
		my ($self) = @_;
		my $cache;
		my $res = $self->pg->db->query("SELECT content FROM lists WHERE name = 'feats';");
		if ($res->rows()) { $cache = $res->hash()->{content}; }
		else { warn "Feats list not yet in database.\n"; }
		$res->finish();
		if (not defined $cache) {
			$cache = try {
				decode 'UTF-8', slurp('feats.html');
			} catch {
				chomp(my $url = slurp('url.conf'));
				warn "Getting $url...\n";
				my $body = Mojo::UserAgent->new()->get($url)->res->body();
				spurt(encode('UTF-8', $body), 'feats.html');
				$body;
			};
			$self->pg->db->query("INSERT INTO lists (name, content) VALUES ('feats', ?);", $cache);
		}

		return $cache;
	}

	sub make {
		my ($self) = @_;

		my $dom = Mojo::DOM->new($self->get_list());
		my $links = $dom->find('div > div > a')->grep(sub { defined( $_->attr('href') ) and $_->attr('href') =~ m!pathfinderogc/feats/.+/.+!; });

		my @feats = map {
			my $name = $_->text();
			my $url  = $_->attr('href');
			my ($types) = $name =~ m/\s+\(([^()]+)\)$/;
			$name =~ s/\s+\([^()]+\)$// if defined $types;
			+{ name => $name, types => $types, url => $url }
		} @{ $links };

		foreach my $feat (@feats) {
			my $id = $self->get_feat_id($feat->{name});
			if (defined $id) {
				warn sprintf "Feat %s already inserted (id: %s).\n", $feat->{name}, $id;
				$self->add_types($feat->{name}, $feat->{types}) if defined $feat->{types};
				next;
			}

			printf "Inserting %s => %s.\n", $feat->{name}, $feat->{url};
			$self->pg->db->query("INSERT INTO feats (name, source) VALUES (?, ?);", $feat->{name}, $feat->{url});
			$self->add_types($feat->{name}, $feat->{types}) if defined $feat->{types};
		}
		return 1;
	}

	sub find {
		my ($self, $feat) = @_;

		my $query = $self->pg->db->query("SELECT feats.id, feats.name, feats.source, array_agg(types.name ORDER BY types.name) AS types FROM feats LEFT JOIN feats_rel_feat_types AS rel ON feats.id = rel.feat LEFT JOIN feat_types AS types ON rel.type = types.id GROUP BY feats.id");
		return () unless $query->rows();

		my @feats = @{ $query->hashes };
		return @feats if not defined $feat;

		my $fuzz = Text::Fuzzy->new($feat);
		return nsort_by { $fuzz->distance( $_->{name} ) }
			grep {
				$fuzz->distance( $_->{name} ) <= length($feat)/2
					or
				index($_->{name}, $feat) != -1
			}
			@feats;
	}

	sub main {
		my ($self, $opts, $feat) = @_;

		return () unless length $feat;

		say "Searching for $feat...";
		my @results = $self->find($feat);

		my ($indent, $width) = (2, 76);
		if ($opts->{raw}) { ($indent, $width) = (0, 0); }
		foreach my $result (@results) {
			say width $width, $result->{name};
			next if $opts->{list};

			my $desc = $self->get_feat($result->{source}, $result->{name});

			if (not $opts->{raw}) { $desc = join "\n\n", map { Mojo::DOM->new($_)->all_text() } split /\n\n/, $desc; }
			say indent $indent, width $width, $desc;
			say '';
		} continue {
			last if $opts->{one};
		}
	}
};

'ok';
