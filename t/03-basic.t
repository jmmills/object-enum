#!perl

use strict;
use warnings;

use Test::More;

use_ok 'Object::Enum';

my $obj = new_ok( 'Object::Enum' => [ [qw[red green blue]] ] );

is $obj->value, undef, 'is default undef';

is $obj->set_red->value, 'red', 'can set red';
ok $obj->is_red;
is $obj->set_green->value, 'green', 'can set green';
ok $obj->is_green;
is $obj->set_blue->value, 'blue', 'can set blue';
ok $obj->is_blue;

is $obj->value, 'blue';

isa_ok [$obj->values], 'ARRAY';
eq_array  [$obj->value], [qw[red green blue]];

ok !$obj->unset;

ok $obj->set_red;

my $new_obj = $obj->clone;

{
    no overloading;
    ok $obj != $new_obj;
    ok $obj->set_blue;
    ok $obj->is_blue;
    #ok $new_obj->is_red;
}

done_testing();
