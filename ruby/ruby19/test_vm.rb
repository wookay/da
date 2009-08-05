# test_vm.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

exit if not defined? RubyVM
code = RubyVM::InstructionSequence.compile "9"
assert_equal ["YARVInstructionSequence/SimpleDataFormat", 1, 1, 1, {:arg_size=>0, :local_size=>1, :stack_max=>1}, "<compiled>", "<compiled>", :top, [], 0, [], [1, [:trace, 1], [:putobject, 9], [:leave]]], code.to_a
