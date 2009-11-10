# encoding: utf-8
# test_bert.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

VERSION=131
SMALL_INT=97
ATOM=100
SMALL_TUPLE = 104
LARGE_TUPLE = 105
module Types
  NIL=106
end
LIST=108
BIN=109
require 'bert'

assert_equal [VERSION,SMALL_INT,1].pack('CCC').force_encoding("UTF-8") , BERT.encode(1)
assert_equal "<<131,97,1>>" , BERT.ebin(BERT.encode(1))
assert_equal "<<131,99,51,46,49,52,48,48,48,48,48,48,48,48,48,48,48,48,48,101,43,48,48,0,0,0,0,0,0,0,0,0,0>>" , BERT.ebin(BERT.encode(3.14))
assert_equal [VERSION,BIN].pack('CC').force_encoding('UTF-8')+['a'.size].pack('N')+'a' , BERT.encode('a')


assert_equal "<<131,106>>", BERT.ebin(BERT.encode([]))
assert_equal "<<131,109,0,0,0,1,97>>", BERT.ebin(BERT.encode('a'))
assert_equal "<<131,109,0,0,0,3,97,98,99>>", BERT.ebin(BERT.encode('abc'))


assert_equal [VERSION,BIN].pack('CC').force_encoding('UTF-8')+['ㄱ'.size].pack('N')+'ㄱ' , BERT.encode('ㄱ')
assert_equal 1 , BERT.decode(BERT.encode(1))
assert_equal 'a' , BERT.decode(BERT.encode('a'))
assert_equal [VERSION,ATOM].pack('CC').force_encoding('UTF-8')+[:foo.to_s.size].pack('n')+:foo.to_s , BERT.encode(:foo)
assert_equal "<<131,100,0,3,102,111,111>>", BERT.ebin(BERT.encode(:foo))
assert_equal "<<131,100,0,1,227,132,177>>", BERT.ebin(BERT.encode('ㄱ'.to_sym))
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:nil].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:nil.to_s.size].pack('n')+:nil.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :nil])
assert_equal [VERSION,SMALL_TUPLE,[:bert,:nil].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:nil.to_s.size].pack('n')+:nil.to_s , BERT.encode(nil)
assert_equal [VERSION,SMALL_TUPLE,[:bert,:true].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:true.to_s.size].pack('n')+:true.to_s , BERT.encode(true)
assert_equal [VERSION,SMALL_TUPLE,[:bert,:false].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:false.to_s.size].pack('n')+:false.to_s , BERT.encode(false)
assert_equal "<<131,104,2,100,0,4,98,101,114,116,100,0,3,110,105,108>>", BERT.ebin(BERT.encode(nil))
assert_equal "<<131,104,2,100,0,4,98,101,114,116,100,0,4,116,114,117,101>>", BERT.ebin(BERT.encode(true))
assert_equal "<<131,104,2,100,0,4,98,101,114,116,100,0,5,102,97,108,115,101>>", BERT.ebin(BERT.encode(false))
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:dict].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :dict])
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:dict,[]].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8')+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :dict, []])
assert_equal "<<131,108,0,0,0,3,100,0,4,98,101,114,116,100,0,4,100,105,99,116,108,0,0,0,2,100,0,1,97,97,1,106,106>>", BERT.ebin(BERT.encode([:bert, :dict, [:a, 1]]))
assert_equal [VERSION,SMALL_TUPLE,[:bert,:dict,[]].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode({})
assert_equal [VERSION,Types::NIL].pack('CC').force_encoding('UTF-8') , BERT.encode([])
assert_equal "<<131,106>>" , BERT.ebin(BERT.encode([]))
assert_equal "<<131,108,0,0,0,1,97,1,106>>" , BERT.ebin(BERT.encode([1]))
assert_equal '<<'+'abc'.unpack('C*').join(',')+'>>' , BERT.ebin('abc')
assert_equal '<<'+'ㄱㄴㄷ'.unpack('C*').join(',')+'>>' , BERT.ebin('ㄱㄴㄷ')

assert_equal 12345678901234567890, BERT.decode(BERT.encode(12345678901234567890))

assert_equal "<<131,104,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,109,0,0,0,0,106>>" , BERT.ebin(BERT.encode(//))
assert_equal "<<131,104,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,109,0,0,0,0,108,0,0,0,2,100,0,8,99,97,115,101,108,101,115,115,100,0,9,109,117,108,116,105,108,105,110,101,106>>" , BERT.ebin(BERT.encode(//im))
assert_equal "<<131,104,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,109,0,0,0,3,97,98,99,106>>" , BERT.ebin(BERT.encode(/abc/))

# bugs
# assert_equal "<<131,106>>", BERT.ebin(BERT.encode(''))
# assert_equal "<<131,109,0,0,0,3,227,132,177>>", BERT.ebin(BERT.encode('ㄱ'))
