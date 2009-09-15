# encoding: utf-8
# oee.rb
#                           wookay.noh at gmail.com

require 'hangul'

class String
  def ㅓㅔㅔ
    ret = ''
    self.split("\n").each do |line|
      cho, jungjong = line.split(' ').map do |word|
        hangul = Hangul.new
        word.anti_chosungs.each do |ch|
          hangul.compose ch #if ch
        end
        [word.chosungs.join, hangul.text]
      end.transpose
      ret.concat <<EOF if jungjong
#{cho.join ' '}
#{jungjong.join ' '}
EOF
    end
    ret
  end
  def ㅏㅔㅔ
    ret = ''
    self.split("\n").each_slice 2 do |cho_line, jungjong_line|
      line = cho_line.split(' ').zip(jungjong_line.split(' ')).map do |cho_word, jungjong_word|
        hangul = Hangul.new
        cho = cho_word.separate
        jungjong_word.separate.each do |ch|
          # FIXME: 연달아 jungsung 나올경우 버그
          hangul.compose cho.shift if ch.jungsung?
          hangul.compose ch
        end
        hangul.text
      end.join ' '
      ret.concat <<EOF
#{line}
EOF
    end
    ret
  end
  def chosungs
    separate :chosung
  end
  def anti_chosungs
    separate :anti_chosung
  end
end



__END__

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end

assert_equal <<EOF, " (짝) ".ㅓㅔㅔ
ㅉ
(ㅏㄱ)
EOF
assert_equal "허경영\n", <<EOF.ㅏㅔㅔ
ㅎㄱㅇ
ㅓㅕ영
EOF
assert_equal "넌 행복해지고\n", <<EOF.ㅏㅔㅔ
ㄴ ㅎㅂㅎㅈㄱ
ㅓㄴ ㅐ오개ㅣㅗ
EOF
