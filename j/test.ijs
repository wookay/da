NB. test.ijs
NB.                            wookay.noh at gmail.com

assert_equals =. 3 : 0
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

assert_equals 1    , 1
assert_equals 3    , 1+2
assert_equals 'a'  , 'a'
assert_equals true , 1=1

exit''
