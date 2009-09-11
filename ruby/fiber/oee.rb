# encoding: utf-8
# oee.rb
#                           wookay.noh at gmail.com

require 'hangul'

class String
  def ㅓㅔㅔ
    hangul = Hangul.new
    jungsungs.zip(jongsungs_with_nil).flatten.each{ |x| hangul.compose x if x }
    <<EOF
#{chosungs.join}
#{hangul.text}
EOF
 end
  def chosungs
    separate :chosung
  end
  def jungsungs
    separate :jungsung
  end
  def jongsungs
    separate :jongsung
  end
  def jongsungs_with_nil
    separate :jongsung_with_nil
  end
end
