require 'code_set'

assert_code = code_set { |a, b| a if a==b }
assert_code.bang <<INPUT, <<OUTPUT
assert_equal(1, 1)
assert_equal(3, 1+2)
assert_equal("a", "a")
assert_equal(true, 1==1)
INPUT
passed: 1
passed: 3
passed: a
passed: true
OUTPUT

assert_equal = assert_code.get_function
assert_equal(2, method(:assert_equal).arity)



func_code = code_set
func_code.bang <<INPUT, <<OUTPUT
func()
func()
func()
func()
INPUT
called: 1
called: 2
called: 3
called: 4
OUTPUT

func = func_code.get_function
assert_equal(0, method(:func).arity)
func()
func()
func()
func()
func()

__END__

require 'patternizer'
pat = Patternizer.new 4, <<EOF
passed: 1
passed: 3
passed: a
passed: true
EOF
puts pat.values
puts pat.format

#puts /abc name/.source

__END__
