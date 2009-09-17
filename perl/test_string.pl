# test_string.pl
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


assert_equal( "apple" , lc("APPLE") );
assert_equal( "aPPLE" , lcfirst("APPLE") );
assert_equal( "APPLE" , uc("apple") );
assert_equal( "Apple" , ucfirst("apple") );
assert_equal( 5, length("apple") );
assert_equal( 1 , index("apple", "p") );
assert_equal( 2 , rindex("apple", "p") );

$str = "apple";
assert_equal( "e" , chop($str) );
assert_equal( "appl" , $str );
assert_equal( 0 , chomp($str) );

$str = "apple\n";
assert_equal( 1 , chomp($str) );
assert_equal( "apple" , $str );

$str = "1 + 2";
assert_equal( 3 , eval($str) );
