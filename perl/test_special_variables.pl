# test_special_variables.pl
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

# $_ : default input and pattern matching space
$_ = "abcd";
/ab/ && assert_equal( 'ab' , 'ab' );
/cd/ && assert_equal( 'cd' , 'cd' );
/ae/ && assert_equal( 'ae' , 'ae' );

# @_ : the list of incoming parameters to a sub
sub fun {
  assert_equal( 10 , $_[0] );
  assert_equal( 20 , $_[1] );
  assert_equal( 30 , $_[2] );
  assert_equal( 2 , $#_ ); # the index number of the last parameter
}

fun(10, 20, 30);


$char = "a";
$var{$char} = 10;
assert_equal( 10 , $var{"a"} );
assert_equal( undef , $var );

$_ = "abc";
s/a/d/g;
assert_equal( "dbc" , $_ );
s/d/a/g;
assert_equal( "abc" , $_ );
