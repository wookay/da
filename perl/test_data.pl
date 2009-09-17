# test_data.pl
#                           wookay.noh at gmail.com

sub assert_equal {
  my $expected = $_[0];
  my $got = $_[1];
  if ($expected eq $got) {
    chomp($expected);
    print "passed: $expected\n";
  } else {
    print "Assertion failed\nExpected: $expected\nGot: $got\n";
  }
}

while(<DATA>) {
  assert_equal( "line1\n" , $_ );
  last;
}

foreach $line (<DATA>) {
  assert_equal( "line2\n" , $line );
  last;
}

__END__
line1
line2
line3
