\\ Fast Counting
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\
\\ http://club.filltong.net/codingdojo/7214

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

ways(n, cnt=0) = {
  for(a=0, n, for(b=0, n, for(c=0, n, for(d=0, n, \
    if(n==a+2*b+3*c+d, cnt+=(a+b+c+d)!/a!/b!/c!/d!, 0)))));
  cnt
}

assert_equal(5, ways(2))
assert_equal(13, ways(3))
assert_equal(33, ways(4))
assert_equal(84, ways(5))
assert_equal(214, ways(6))
assert_equal(545, ways(7))
assert_equal(6257097, ways(17))
assert_equal(71837707768, ways(27))
assert_equal(824768460086879, ways(37))
assert_equal(9469163673079988640, ways(47))
assert_equal(31203505712236975348528576040635119800253, ways(100))

quit
