package Util::Feat {

	use Mojo::Base -base;

	use List::UtilsBy qw/ nsort_by /;
	use Mojo::Pg;
	use Mojo::Util 'html_unescape';
	use Text::Fuzzy;
	use Text::Markdown qw/ markdown /;

	has pg => sub { Mojo::Pg->new('postgresql:///pathfinder'); };

	sub get_desc {
		my ($self, $name) = @_;

		my @feats;
		foreach my $feat (split /\|/, $name) {
			push @feats, map { $self->_render_description($_) } @{ $self->pg->db->query('SELECT * FROM feats WHERE name = ?;', $feat)->hashes() };
		}
		return join '<p>', @feats;
	}

	sub _render_description {
		my ($self, $feat) = @_;
		my @types = @{ $self->pg->db->query('SELECT * FROM feats_with_types WHERE id = ?;', $feat->{id})->hash()->{types} };
		my @prereqs = grep defined, @{ $self->pg->db->query('SELECT * FROM feats_with_feats WHERE id = ?;', $feat->{id})->hash()->{feats} };
		my @races = grep defined, @{ $self->pg->db->query('SELECT * FROM feats_with_races WHERE id = ?;', $feat->{id})->hash()->{races} };
		my @skills = grep defined, @{ $self->pg->db->query('SELECT * FROM feats_with_skills WHERE id = ?;', $feat->{id})->hash()->{skills} };

		my @lines = '<p><i>Source: ' . $feat->{source} . '</i></p>';
		push @lines, sprintf "<h2>%s%s</h2>", $feat->{name}, @types ? sprintf(" (%s)", join ", ", @types) : '';
		push @lines, $self->_parse($feat->{description});
		push @lines, $self->_parse('<b>Prerequisites:</b> ', _linkify_prereqs($feat->{prerequisites}, \@prereqs, \@races, \@skills));
		push @lines, $self->_parse('<b>Benefit:</b> ', $feat->{benefit});
		push @lines, $self->_parse('<b>Normal:</b> ', $feat->{normal});
		push @lines, $self->_parse('<b>Special:</b> ', $feat->{special});
		push @lines, $self->_parse('<b>Goal:</b> ', $feat->{goal});
		push @lines, $self->_parse('<b>Completion Benefit:</b> ', $feat->{completion_benefit});
		push @lines, $self->_parse('<b>Note:</b> ', $feat->{note});
		push @lines, $self->_parse('<b>Suggested Traits:</b> ', $feat->{suggested_traits});

		return sprintf '<div class="feat">%s</div>', join "\n", @lines;
	}

	sub _linkify_prereqs {
		my ($prereqs, $feats, $races, $skills) = @_;
		return undef if not defined $prereqs;

		foreach my $feat (@$feats) {
			$prereqs =~ s!(?:^|, | or )\K(\Q$feat\E)!<a href="/feats/$feat">$1</a>!ig;
		}

		return $prereqs;
	}

	sub _parse {
		my $self = shift;
		return () if not defined $_[-1];

		my $text = pop;
		my @phrases = reverse nsort_by { length $_->{phrase} } @{ $self->pg->db->query("SELECT * FROM phrases WHERE ? ILIKE '%' || phrase || '%'", $text)->hashes() };
		foreach my $phrase (@phrases) {
			my ($phr, $lnk) = @{ $phrase }{'phrase', 'link'};

			my $dom = Mojo::DOM->new($text);
			foreach my $node (@{ $dom->child_nodes }) {
				next if $node->type ne 'text';

				my $txt = html_unescape $node->to_string();
				$txt =~ s!\b(\Q$phr\E)\b!<a href="$lnk">$1</a>!ig;
				$node->replace($txt);
			}
			$text = html_unescape $dom->content();
		}

		$text = join "", @_, $text;

		$text = markdown($text, { empty_element_suffix => '>', });
		return $text;
	}

	sub find {
		my ($self, $feat, $filter) = @_;

		my $q;
		my ($type, $source) = @{ $filter }{'type', 'source'};
		if (defined $type and defined $source) {
			$q = $self->pg->db->query('SELECT * FROM feats_with_types WHERE types @> ARRAY[?] AND source = ? ORDER BY name;', $type, $source);
		} elsif (defined $type) {
			$q = $self->pg->db->query('SELECT * FROM feats_with_types WHERE types @> ARRAY[?] ORDER BY name;', $type);
		} elsif (defined $source) {
			$q = $self->pg->db->query('SELECT * FROM feats_with_types WHERE source = ? ORDER BY name;', $source);
		} else {
			$q = $self->pg->db->query('SELECT * FROM feats_with_types ORDER BY name;');
		}

		my @feats = map { +{ name => $_->{name}, display => sprintf("%s (%s)", $_->{name}, join ", ", @{ $_->{types} } ), } } @{ $q->hashes() };
		return 1, @feats if not defined $feat;

		my $fuzz = Text::Fuzzy->new($feat);
		return 0, nsort_by { $fuzz->distance( $_->{name} ) }
			grep {
				$fuzz->distance( $_->{name} ) <= length($feat)/2
					or
				index($_->{name}, $feat) != -1
			}
			@feats;
	}
};

'ok';
