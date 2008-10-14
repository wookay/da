\\ Path Finder
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\
\\ http://club.filltong.net/codingdojo/7339

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

vecjoin(v, sp="") =
  r=""; for(x=1, #v, r=concat(r, v[x]); if(x==#v, 0, r=concat(r, sp))); r

walk(spath) = {
  vecjoin(Vec(spath))
}

assert_equal("X...O", walk("X___O"))
assert_equal("X.#.O\n__.__", walk("X_#_O\n_____"))
