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

ways(n) = {
  cnt = 0;
  for(a=0, n, for(b=0, (n-a)/2, for(c=0, (n-a-2*b)/3, for(d=0, n-a-2*b-3*c, \
    if(n==a+2*b+3*c+d, cnt+=(a+b+c+d)!/a!/b!/c!/d!, 0)))));
  cnt
}

assert_equal(5, ways(2))
assert_equal(13, ways(3))
assert_equal(33, ways(4))
assert_equal(84, ways(5))
assert_equal(214, ways(6))
assert_equal(545, ways(7))
assert_equal(1388, ways(8))
assert_equal(3535, ways(9))
assert_equal(9003, ways(10))
assert_equal(103363394, ways(20))
assert_equal(1186714748389, ways(30))
assert_equal(13624667685000564, ways(40))
assert_equal(156424759849575406340, ways(50))
assert_equal(1795912095598119184914241, ways(60))
assert_equal(20618860199735717347518335205, ways(70))
assert_equal(236725058525014180505701815496823, ways(80))
assert_equal(2717839530935355329581432067133860494, ways(90))
assert_equal(31203505712236975348528576040635119800253, ways(100))
assert_equal(1241649949949411331414675507221119818542350748348331145625269112252246894127622673, ways(200))
assert_equal(49407736823775362100559203730192478236178994112357498845569479867183883717796751246977341976663503093813539567279506144466, ways(300))
assert_equal(1966032743888007151654911213929640228817259558852295305552344380050380326276735635038078212976113431547170243801041791072217960550520592369177016708260977015953964, ways(400))
\\ assert_equal(?, ways(1000))

quit
