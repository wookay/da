# test.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'llvm'
include LLVM

m = LLVM::Module.new "Module"
type = Type::function MACHINE_WORD, []
fun = m.get_or_insert_function "fun", type
builder = fun.create_block.builder
value = builder.add 2.llvm, 3.llvm
builder.return value
ExecutionEngine.get m

assert_equal 5, ExecutionEngine.run_autoconvert(fun)
