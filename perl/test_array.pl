# test_array.pl
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

@ary = (100, 101, 102);
assert_equal( 100 , @ary[0] );

@ary = (100 .. 102);
assert_equal( 100 , @ary[0] );

@ary = qw(a b c);
assert_equal( 'a' , @ary );
assert_equal( 'a' , @ary[0] );

push(@ary, 'd' );
assert_equal( 'd' , @ary[-1] );

pop(@ary);

assert_equal( 3 , scalar(@ary) );
$scalar_ary = @ary;
assert_equal( 3 , $scalar_ary );

$str = "a b c";
@ary = split(' ', $str);
assert_equal( 3 , scalar(@ary) );
assert_equal( "abc" , join("", @ary) );

@ary = qw(5 4 3 2 1);
assert_equal( "1 2 3 4 5" , join(" ", sort(@ary)) );

foreach $e (@ary) {
}
