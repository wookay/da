# broken_hangul.rb
#                           wookay.noh at gmail.com

require 'iconv'

def recover_cp949_encoding_iso8859_decode str
  cp949 = str.unpack('U*').pack('C*')
  Iconv::iconv('UTF-8','CP949', cp949).first
end

def recover_utf8_encoding_cp949_decode str
  cp949 = Iconv::iconv('CP949','UTF-8', str).first
  recover_cp949_encoding_iso8859_decode(cp949)
end

require 'hangul'
def recover_typing_dubul_in_english_keyboard str
  dubul = map_english_to_dubul(str)
  hangul = Hangul.new
  dubul.each do |ch|
    hangul.compose ch
  end
  hangul.text
end
