#!/usr/bin/env ruby
# encoding: utf-8
# oee.rb
#                           wookay.noh at gmail.com

$LOAD_PATH.unshift "#{File.dirname __FILE__}"
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



puts STDIN.read.force_encoding("UTF-8").ㅓㅔㅔ if $0==__FILE__
