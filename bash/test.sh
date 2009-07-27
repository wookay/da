# test.sh
#                           wookay.noh at gmail.com

assert_equal() {
  if test $1 -eq $2; then
    echo "passed: $1"
  else
    echo "Assertion failed"
    echo "Expected: $1"
    echo "Got: $2"
  fi
}

assert_equal 1 1
assert_equal 3 `expr 1 + 2`
