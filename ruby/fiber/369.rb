# encoding: utf-8
# 369.rb
#                           wookay.noh at gmail.com

require 'fiber'

class Clap < Fiber
  def initialize
    super do
      n = 0
      loop do
        n += 1
        cnt = n.to_s.count '369'
        Fiber.yield 0==cnt ? 0==n%10 ? '뿌'*(n/10)+'쑝' : n : '짝'*cnt
      end
    end
  end
end


if $0==__FILE__
  clap = Clap.new 
  INPUT = 21
  INPUT.times { print clap.resume, ' ' }
  puts
end
