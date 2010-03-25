NB. test_inv.ijs
NB.                            wookay.noh at gmail.com

assert_equal =. 3 : 0
  if. =/ y do.
    stdout 'passed: '
    echo 1 {. y
  else.
    echo 'Assertion failed'
    stdout 'Expected: '
    echo 1 {. y
    stdout 'Got: '
    echo 1 }. y
  end.
)

assert_equal 3   ,  + inv / 2 5
assert_equal _3  ,  + inv / 5 2
assert_equal 3   ,  * inv / 2 6
assert_equal 1   ,  >. * inv / 6 2

exit''
