#!/usr/bin/env perl
use FindBin '$RealBin';
use lib "$RealBin/tools";

use Util::Feat;
use Util::Text qw/ indent /;
use Mojolicious::Lite;
use Mojo::Pg;
use Scalar::Util 'refaddr';

plugin CHI => { default => { driver => 'Memory', global => 1, max_size => '20m' } };

my $pg = Mojo::Pg->new('postgresql:///pathfinder');
my $feat_db = Util::Feat->new(pg => $pg);

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

get '/feats/:feat' => sub { shift->render(template => 'feat'); };
any '/feats' => sub { shift->check_cache(feats => sub { shift->render_to_string(template => 'feats');}); };

helper check_cache => sub {
	my ($c, $key, $cb) = @_;

	return $c->render(data => $cb->($c)) if @{ $c->req->params() };

	# Else we need to check the cache
	my $cache = $c->chi->get($key);

	if (not defined $cache) {
		$cache = $cb->($c);
		$c->chi->set($key => $cache, '30 min');
	}

	return $c->render(data => $cache);
	
};

helper get_feat_list => sub {
	my ($c, $search, $type) = @_;

	my ($sorted, @results) = $feat_db->find($search, $type);

	my $last = '';
	my @jumps;
	my @feats = map {
		my @return = { name => $_->{display}, url => sprintf("/feats/%s", $_->{name}), };
		if ($sorted) {
			my $cur = substr $_->{name}, 0, 1;
			if ($cur ne $last) {
				$last = $cur;
				push @jumps, $cur;
				unshift @return, { jump => $cur };
			}
		}
		@return; } @results;

	return {jumps => \@jumps, list => \@feats};
};

helper get_feat => sub {
	my ($c, $feat) = @_;
	my $desc = $feat_db->get_desc($feat);

	return indent 6, $desc;
};

helper get_feat_types => sub {
	my ($c) = @_;

	my @types = ({ name => 'Remove Filter', url => $c->url_with->query([type => undef]) }, map { +{ name => $_, url => $c->url_with->query([type => $_])->to_string } }
		@{ $pg->db->query('SELECT name FROM feat_types ORDER BY name;')->hashes()->map(sub { $_->{name} }) });
	return { header => 'Filter by Type', collapsable => 'type', jumps => [], list => \@types };
};

helper get_feat_sources => sub {
	my ($c) = @_;
	
	my @sources = ({ name => 'Remove Filter', url => $c->url_with->query([source => undef]) }, map { +{ name => $_, url => $c->url_with->query([source => $_])->to_string } }
		@{ $pg->db->query('SELECT source FROM feats GROUP BY source ORDER BY source;')->hashes()->map(sub { $_->{source} }) });
	return { header => 'Filter by Source', collapsable => 'source', jumps => [], list => \@sources };
};

helper render_list => sub {
	my $c = shift;
	my $cb = shift;

	my $spec = $c->$cb(@_);

	my $collapsable = $spec->{collapsable};
	my $header = $spec->{header};
	my @jumps = @{ $spec->{jumps} };
	my $jump_html = '';
	if (@jumps) {
		$jump_html .= '<a name="jump">Jump to</a>: ' . join " | ", map { sprintf '<a href="#%1$s">%1$s</a>', $_; } @jumps;
	}

	my @list = @{ $spec->{list} };
	my $list_html = '';
	foreach my $item (@list) {
		if (exists $item->{jump}) {
			if (length $list_html) { $list_html .= '</ul>'; }
			$list_html .= sprintf '<h3 class="jump"><a name="%1$s">%1$s</a></h3><a href="#jump" class="jump">^Top</a>', $item->{jump};
			$list_html .= '<ul>';
		} elsif (exists $item->{url}) {
			if (not length $list_html) { $list_html .= '<ul>'; }
			$list_html .= sprintf '<li><a href="%s">%s</a>%s', $item->{url}, $item->{name}, "\n";
		} elsif (exists $item->{content}) {
			$list_html .= $item->{content};
		} else {
			$list_html .= join "<br>\n", map { "$_ => " . $item->{$_} } sort keys %{ $item };
		}
	}
	if (length $list_html) { $list_html .= '</ul>'; }

	my $html = '';
	if (length $jump_html) { $html .= sprintf '<div class="jump">%s</div>', $jump_html; }
	if (length $list_html) { $html .= sprintf '<div class="list">%s</div>', $list_html; }
	if ($collapsable)      { $html = sprintf '
<input class="toggle" type="checkbox" id="toggle-%s">
<div class="collapsable">
  <div class="fader">
    <div class="blocker">
      <label for="toggle-%1$s" class="toggle">%s</label>
    </div>
  </div>
  %s
</div>', $collapsable, $header // 'Toggle', $html; }

	return $html;
};

app->secrets(['foo']);
app->start;
__DATA__

@@ index.html.ep
% layout 'base';
% title 'Games';
<div class="navigation"><ul>
	<li><%= link_to Feats => '/feats' %>
</ul></div>
<h1>Games</h1>

