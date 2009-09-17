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
    0x660E => [12103, 12105],
    0x9249 => [12039, 12083, 12198]
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
      separated = @text.hanja_separate
      case separated.size
      when 0
        @text.concat char
      else
        johab = (separated + [char]).hanja_johab
        @text = johab
      end
      @text
    when :depose
      separated = @text.hanja_separate
      separated.pop
      johab = separated.hanja_johab
      case johab
      when HanjaObject
        @text = johab.join
      else
        @text = johab
      end
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

HanjaObject = Struct.new :ary
class HanjaObject
  def join
    self.ary.join
  end
  def + char
    (self.ary + [char]).hanja_johab
  end
end


class String
  def hanja_separate
    ret = []
    self.unpack('U*').each do |k|
      v = HANJA_DIC[k]
      if v
        v.each do |x|
          ret.push [x].pack('U')
        end
      else
        ret.push [k].pack('U')
      end
    end
    ret
  end
end

class Array
  def hanja_johab
    found = nil
    case self.size
    when 0
    when 1
      found = first
    else 
      s = self.map { |x| x.unpack('U').first }.sort
      HANJA_DIC.each do |k, v|
        if v == s
          found = [k].pack('U')
          break
        end
      end
      if not found
        found = HanjaObject.new self
      end
    end
    found
  end
end
