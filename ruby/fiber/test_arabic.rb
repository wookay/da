# encoding: utf-8
# test_arabic.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'arabic'

arabic = Arabic.new
assert_equal           'ﺍ' , arabic.compose('ا')
assert_equal          'ﻝﺍ' , arabic.compose('ل')
assert_equal         'ﺲﻟﺍ' , arabic.compose('س')
assert_equal        'ﻞﺴﻟﺍ' , arabic.compose('ل')
assert_equal        'ﻼﺴﻟﺍ' , arabic.compose('ا')
assert_equal       'ﻡﻼﺴﻟﺍ' , arabic.compose('م')
assert_equal      ' ﻡﻼﺴﻟﺍ' , arabic.compose(' ')
assert_equal     'ﻉ ﻡﻼﺴﻟﺍ' , arabic.compose('ع')
assert_equal    'ﻞﻋ ﻡﻼﺴﻟﺍ' , arabic.compose('ل')
assert_equal   'ﻲﻠﻋ ﻡﻼﺴﻟﺍ' , arabic.compose('ي')
assert_equal  'ﻚﻴﻠﻋ ﻡﻼﺴﻟﺍ' , arabic.compose('ك')
assert_equal 'ﻢﻜﻴﻠﻋ ﻡﻼﺴﻟﺍ' , arabic.compose('م')
