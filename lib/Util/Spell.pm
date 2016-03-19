package Util::Spell {

	use Mojo::Base -base;
	use feature 'fc';

	use List::UtilsBy qw/ nsort_by /;
	use Mojo::Pg;
	use Mojo::Util 'html_unescape';
	use Text::Fuzzy;
	use Util::Text qw/ in md /;

	has pg => sub { Mojo::Pg->new('postgresql:///pathfinder'); };

	sub get_desc {
		my ($self, $name) = @_;

		my @spells;
		foreach my $spell (split /\|/, $name) {
			push @spells, map { $self->_render_description($_) } $self->get_spells($name);
		}
		return join '<p>', @spells;
	}

	sub get_spells {
		my ($self, $name) = @_;

		return @{ $self->pg->db->query('SELECT * FROM spells WHERE name = ?', $name)->hashes() };
	}

	sub get_spell {
		my ($self, $sid) = @_;

		return $self->pg->db->query('SELECT * FROM spells WHERE id = ?', $sid)->hashes()->[0];
	}

	sub get_classes {
		my ($self, $sid) = @_;

		return @{ $self->pg->db->query('SELECT * FROM spells_rel_class WHERE spell = ? ORDER BY class;', $sid)->hashes() };
	}

	sub _render_description {
		my ($self, $spell) = @_;
		my @classes = @{ $self->pg->db->query('SELECT * FROM spells_rel_class WHERE spell = ? ORDER BY class;', $spell->{id})->hashes() };

		my @lines = '<p><i>Source: ' . $spell->{source} . '</i></p>';
		push @lines, $spell->{short_description} if defined $spell->{short_description};
		push @lines, sprintf "<h2>%s%s</h2>", $spell->{name}, defined $spell->{descriptor} ? sprintf " [%s]", $spell->{descriptor} : '';
		push @lines, join "", '<b>School:</b> ', $self->_parse("\u$spell->{school}"), defined $spell->{subschool} ? sprintf " (%s)", $self->_parse("\u$spell->{subschool}") : '', if defined $spell->{school};
		push @lines, $self->_parse(join " / ", map { sprintf "%s %s", "\u$_->{class}", $_->{level} } @classes);

		my @casting;
		push @casting, $self->_parse('<b>Casting time:</b> ',$spell->{casting_time});
		push @casting, $self->_parse('<b>Components:</b> ',$spell->{components});
		push @casting, $self->_parse('<b>Material costs:</b> ',$spell->{material_costs});
		push @casting, $self->_parse('<b>Range:</b> ',$spell->{range});
		push @casting, $self->_parse('<b>Area:</b> ',$spell->{area});
		push @casting, $self->_parse('<b>Effect:</b> ',$spell->{effect});
		push @casting, $self->_parse('<b>Targets:</b> ',$spell->{targets});
		push @casting, $self->_parse('<b>Duration:</b> ',$spell->{duration});
		push @casting, $self->_parse('<b>Saving Throw:</b> ',$spell->{saving_throw});
		push @casting, $self->_parse('<b>Spell Resistance:</b> ',$spell->{spell_resistance});
		push @casting, $self->_parse('<b>Deity:</b> ',$spell->{deity});
		push @casting, $self->_parse('<b>Domain:</b> ',$spell->{domain});
		push @casting, $self->_parse('<b>Bloodline:</b> ',$spell->{bloodline});
		push @casting, $self->_parse('<b>Patron:</b> ',$spell->{patron});
		push @lines, join "<br>\n", @casting, '' if @casting;

		push @lines, md $self->_parse('<b>Description:</b> ',$spell->{description});

		my @mythic;
		push @mythic, md $self->_parse('<b>Mythic:</b> ',$spell->{mythic_text});
		push @mythic, md $self->_parse(sprintf('<b>%s:</b> %s', split /: ?/,  $spell->{augmented}, 2)) if defined $spell->{augmented};
		push @lines, join "<br>\n", @mythic if @mythic;

		return sprintf '<div class="spell"><div class="editlink"><a href="/edit/spell/%s">Edit</a></div>%s</div>', $spell->{id}, join "\n", map { @{ Mojo::DOM->new($_)->child_nodes } != 1 ? "<p>$_</p>" : $_ } @lines;
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

		return $text
	}

	sub descriptors {
		return qw/
			acid air chaotic cold curse darkness death disease
			earth electricity emotion evil fear fire force good
			language_dependent lawful light mind_affecting
			mythic pain poison shadow sonic water
			/;
	}

	sub schools {
		return qw/ abjuration conjuration divination enchantment evocation illusion necromancy transmutation /;
	}

	sub create_query {
		my ($self, $filter) = @_;
		my ($class, $source, $descriptor, $school) = @{ $filter }{qw/ class source descriptor school /};

		my @fields = qw/ name short_description /;
		my @tables = qw/ spells /;
		my @wheres;
		my @binds;
		my $order = 'name';

		# class filter
		push @fields, 'level' if defined $class;
		push @tables, 'spells_rel_class' if defined $class;
		push @wheres, 'id = spell AND class = ?' if defined $class;
		$order = "level, $order" if defined $class;
		push @binds, $class if defined $class;

		# descriptor filter
		push @wheres, "$descriptor = 't'" if defined $descriptor;

		# source filter
		push @wheres, 'source = ?' if defined $source;
		push @binds, $source if defined $source;

		# school filter
		push @wheres, 'school = ?' if defined $school;
		push @binds, $school if defined $school;

		my $fields = join ", ", @fields;
		my $tables = join ", ", @tables;
		my $wheres = sprintf "WHERE %s", join " AND ", @wheres if @wheres;
		my $query = sprintf 'SELECT %s FROM %s %s ORDER BY %s', $fields, $tables, $wheres, $order;

		#warn sprintf qq'Query: "%s"\nBinds: %s\n', $query, join ", ", map { "'$_'" } @binds;
		return $self->pg->db->query($query, @binds);
	}

	sub find {
		my ($self, $spell, $filter) = @_;

		my ($class, $source, $descriptor) = @{ $filter }{'class', 'source', 'descriptor'};
		return () if defined $descriptor and not in($descriptor, descriptors());
		my $q = $self->create_query($filter);

		my @spells = @{ $q->hashes() };
		return 1, @spells if not defined $spell;

		$spell = fc($spell);
		my $fuzz = Text::Fuzzy->new($spell);
		return 0, nsort_by { $fuzz->distance( fc($_->{name}) ) }
			grep {
				$fuzz->distance( fc($_->{name}) ) <= length($spell)/2
					or
				index(fc($_->{name}), $spell) != -1
			}
			@spells;
	}
};

'ok';
