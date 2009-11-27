# encoding: utf-8
# broken_hangul.rb
#                           wookay.noh at gmail.com

require 'iconv'

def recover_cp949_encoding_iso8859_decode str
  cp949 = str.unpack('U*').pack('C*')
  Iconv::iconv('UTF-8','CP949', cp949).first
end
def make_cp949_encoding_iso8859_decode str
  cp949 = Iconv::iconv('CP949','UTF-8', str).first
  cp949.unpack('C*').pack('U*')
end

def recover_utf8_encoding_cp949_decode str
  cp949 = Iconv::iconv('CP949','UTF-8', str).first
  recover_cp949_encoding_iso8859_decode(cp949)
end

require 'hangul'
def recover_typing_dubul_in_english_keyboard str
  map_english_to_dubul(str).johab
end
def recover_typing_sebul_in_english_keyboard str
  map_english_to_sebul(str).johab
end
def recover_typing_english_in_dubul_keyboard str
  map_dubul_to_english str
end
def recover_typing_english_in_sebul_keyboard str
  map_sebul_to_english str
end

require 'cgi'
def recover_escaped_utf8 str
  CGI.unescape(str)
end
def recover_escaped_cp949 str
  cp949 = CGI.unescape(str).unpack('C*').pack('U*')
  recover_cp949_encoding_iso8859_decode cp949
end

def recover str
  str
#  case str.unpack('C*').select{|x| 
#    puts x
#    x.to_i > 170 && x.to_i < 200}.size
#  when 0
#    str  
#  else
#    recover_utf8_encoding_cp949_decode str
#  end
end
