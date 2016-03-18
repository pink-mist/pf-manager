package Util::Phrase {

	use Mojo::Base -base;
	use feature 'fc';

	use List::UtilsBy qw/ nsort_by /;
	use Mojo::Pg;

	has pg => sub { Mojo::Pg->new('postgresql:///pathfinder'); };

	sub analyse {
		my ($self, $text) = @_;

		my $q = $self->pg->db->query(q"SELECT * FROM phrases WHERE ? ILIKE '%' || phrase || '%';", $text);
		return reverse nsort_by { length $_->{phrase} } @{ $q->hashes() };
	}

};

'ok';
