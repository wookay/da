\\ Counting
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
  ary = [];
  for(x=1,
      1000,
      if(n==sumof(x), ary=concat(ary, [x]), nothing)
  );
  ary
}

sumof(n) = {
  s = 0;
  known_set = Set([1, 2, 3, 4]);
  known_table = [1, 2, 3, 1];
  num = Vec(Str(n));
  if(known_set==setunion(known_set,Set(num)), nothing, return(0));
  for(x=1,
      #num,
      idx = eval(num[x]); s += known_table[idx]
  );
  s
}


assert_equal(6, sumof(132))
assert_equal(9, sumof(112314))
assert_equal([2, 11, 14, 41, 44], ways(2))
assert_equal([3, 12, 21, 24, 42, 111, 114, 141, 144, 411, 414, 441, 444], ways(3))
assert_equal(5, #ways(2))
assert_equal(13, #ways(3))
\\ assert_equal(33, #ways(4))
\\ assert_equal(84, #ways(5))
\\ assert_equal(214, #ways(6))
\\ assert_equal(545, #ways(7))

quit
