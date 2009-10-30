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
assert_equal [VERSION,BIN].pack('CC').force_encoding('UTF-8')+['a'.size].pack('N')+'a' , BERT.encode('a')
assert_equal [VERSION,BIN].pack('CC').force_encoding('UTF-8')+['ㄱ'.size].pack('N')+'ㄱ' , BERT.encode('ㄱ')
assert_equal 1 , BERT.decode(BERT.encode(1))
assert_equal 'a' , BERT.decode(BERT.encode('a'))
assert_equal [VERSION,ATOM].pack('CC').force_encoding('UTF-8')+[:s.to_s.size].pack('n')+:s.to_s , BERT.encode(:s)
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:nil].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:nil.to_s.size].pack('n')+:nil.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :nil])
assert_equal [VERSION,SMALL_TUPLE,[:bert,:nil].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:nil.to_s.size].pack('n')+:nil.to_s , BERT.encode(nil)
assert_equal [VERSION,SMALL_TUPLE,[:bert,:true].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:true.to_s.size].pack('n')+:true.to_s , BERT.encode(true)
assert_equal [VERSION,SMALL_TUPLE,[:bert,:false].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:false.to_s.size].pack('n')+:false.to_s , BERT.encode(false)
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:dict].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :dict])
assert_equal [VERSION,LIST].pack('CC').force_encoding('UTF-8')+[[:bert,:dict,[]].size].pack('N')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8')+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode([:bert, :dict, []])
assert_equal [VERSION,SMALL_TUPLE,[:bert,:dict,[]].size].pack('CCC').force_encoding('UTF-8')+[ATOM].pack('C').force_encoding('UTF-8')+[:bert.to_s.size].pack('n')+:bert.to_s+[ATOM].pack('C').force_encoding('UTF-8')+[:dict.to_s.size].pack('n')+:dict.to_s+[Types::NIL].pack('C').force_encoding('UTF-8') , BERT.encode({})
assert_equal [VERSION,Types::NIL].pack('CC').force_encoding('UTF-8') , BERT.encode([])
assert_equal '<<'+'abc'.unpack('C*').join(',')+'>>' , BERT.ebin('abc')
assert_equal '<<'+'ㄱㄴㄷ'.unpack('C*').join(',')+'>>' , BERT.ebin('ㄱㄴㄷ')
