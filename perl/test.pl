# test.pl
#                           wookay.noh at gmail.com

sub assert_equal {
  my $expected = $_[0];
  my $got = $_[1];
  if ($expected==$got) {
    print "passed: $expected\n";
  } else {
    print "Assertion failed\nExpected: $expected\nGot: $got\n";
  }
}

assert_equal( 1   , 1    );
assert_equal( 3   , 1+2  );
assert_equal( "a" , 'a'  );
assert_equal( 1   , 1==1 );
