package Util::Text {

	use strict;
	use warnings;

	use Exporter qw/ import /;

	our @EXPORT_OK = qw/ indent width in /;

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

	sub in {
		my ($first, @rest) = @_;
		foreach my $rest (@rest) { return 1 if $first eq $rest; }
		return 0;
	}
};

'ok';
