# j.rb
#                           wookay.noh at gmail.com

require 'fiber'

JCONSOLE = '/Applications/j602/bin/jconsole'
if not File.exists? JCONSOLE
  puts "please download J http://www.jsoftware.com/"
  exit
end

class Worker
  def initialize
    @code = ''
  end
  def feed datatype, obj
    case datatype
    when :noun
      token = " #{obj}"
    else
      token = obj
    end
    @code.concat token
    result = `echo "#{@code}" | #{JCONSOLE}`.strip
    case datatype
    when :noun
      case obj
      when Fixnum
        result = result.to_i
      end
    end 
    result
  end
end

class J < Fiber
  def initialize
    super do |datatype, obj|
      worker = Worker.new
      loop do
        result = worker.feed datatype, obj
        datatype, obj = Fiber.yield result
      end
    end
  end
  def verb obj
    resume :verb, obj
  end
  def adverb obj
    resume :adverb, obj
  end
  def noun obj
    resume :noun, obj
  end
end
