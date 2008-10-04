use strict;
use warnings;

use Data::Rx;
use Data::Rx::Type::MooseTC;
use Test::More tests => 2;

my $rx = Data::Rx->new({
  prefix  => {
    moose => 'tag:rjbs.manxome.org,2008-10-04:rx/moose/',
  },
  plugins => [ 'Data::Rx::Type::MooseTC' ]
});

my $array_of_int = $rx->make_schema({
  type       => '/moose/tc',
  moose_type => 'ArrayRef[Int]',
});

ok($array_of_int->check([1]), "[1] is an ArrayRef[Int]");
ok(! $array_of_int->check( 1 ), "1 is not an ArrayRef[Int]");
