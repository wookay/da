# encoding: utf-8
# hanja.rb
#                           wookay.noh at gmail.com

# hanja_utf8_normal_char.txt  from
# Table of Decomposition Serials of the 20902, ExtA and HKSCS characters
# http://glyph.iso10646hk.net/doc/normal_char.txt

require 'fiber'

def get_hanja_dic
  hash = {}
  open('hanja_utf8_normal_char.txt').readlines.map do |line|
    _, char, _, comps = line.split ' '
    hash[char.hex] = comps.split('/').map do |comp|
      _, c = comp.split('_')
      c[0..3].hex if c
    end if comps
  end
  hash
end

if defined? USE_TEST_DIC
  HANJA_DIC = { 
    0x6797 => [12106, 12106],
    0x660E => [12103, 12105]
  }
else
  HANJA_DIC = get_hanja_dic
end


class Worker
  def initialize
    @text = ''
  end
  def feed pose, char
    case pose
    when :compose
      *pre, last = @text.split ''
      if last
        case pre
        when Array
          @text = pre.join.concat [last, char].hanja_johab
        when String
          @text.concat [last, char].hanja_johab
        else
          puts :eee
        end
      else
        @text.concat char 
      end
      @text
    when :depose
      separated = @text.hanja_separate
      separated.pop
      @text = separated.hanja_johab
    when :pop
      separated = @text.hanja_separate
      result = separated.pop
      @text = separated.hanja_johab
      result
    when :text
      @text
    end
  end
end

class Hanja < Fiber
  def initialize
    super do |pose, char|
      worker = Worker.new
      loop do
        result = worker.feed pose, char
        pose, char = Fiber.yield result
      end
    end
  end
  def compose char
    resume :compose, char
  end
  def depose
    resume :depose, nil
  end
  def pop
    resume :pop, nil
  end
  def text
    resume :text, nil
  end
end


class String
  def hanja_separate
    ret = []
    self.unpack('U*').each do |k|
      v = HANJA_DIC[k]
      v.each do |x|
        ret.push [x].pack('U')
      end
    end
    ret
  end
end

class String
  def self.include_HanjaCalculus
    def + char
      if self.empty?
        char
      else
        hanja = Hanja.new
        hanja.compose self
        hanja.compose char
      end
    end
    def * num
      ret = ''
      num.times do
        ret += self
      end
      ret
    end
  end
end

class Array
  def hanja_johab
    a, b = self
    found = ''
    if b
      s = [a.unpack('U').first, b.unpack('U').first].sort
      HANJA_DIC.each do |k, v|
        if v == s
          found = [k].pack('U')
          break
        end
      end
    elsif a
      found = a
    end
    found
  end
end
