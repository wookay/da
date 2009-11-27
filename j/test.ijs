NB. test.ijs
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

true =. 1

assert_equal 1    , 1
assert_equal 3    , 1+2
assert_equal 'a'  , 'a'
assert_equal true , 1=1
assert_equal 1    , (1%3)+(1%3)+(1%3)

exit''
