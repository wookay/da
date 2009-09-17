# test_hash.pl
#                           wookay.noh at gmail.com

sub assert_equal {
  my $expected = $_[0];
  my $got = $_[1];
  if ($expected eq $got) {
    print "passed: $expected\n";
  } else {
    print "Assertion failed\nExpected: $expected\nGot: $got\n";
  }
}

%hash = ('a', 10, 'b', 20);
assert_equal( 10 , $hash{a} );
assert_equal( 10 , $hash{'a'} );

@keys = keys(%hash);
assert_equal( 'b' , $keys[1] );
assert_equal( 2 , scalar(@keys) );

@values = values(%hash);
assert_equal( 20 , $values[1] );
assert_equal( undef , $values[2] );

$hash{c} = 3;
delete($hash{c});
