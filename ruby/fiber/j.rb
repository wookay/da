# j.rb
#                           wookay.noh at gmail.com

require 'fiber'
require 'timeout'

JCONSOLE = '/Applications/j602/bin/jconsole'
if not File.exists? JCONSOLE
  puts "please download J : http://www.jsoftware.com/"
  exit
end

class Worker
  def initialize
    @timeout = 0.1
    @code = ''
  end
  def feed datatype, obj
    case datatype
    when :noun
      token = "#{obj} "
    else
      token = obj
    end
    @code.concat token
    result = nil
    begin
      status = Timeout::timeout @timeout do
        result = `echo "#{@code}" | #{JCONSOLE}`.strip
      end
    rescue Exception => e
      result = e.class
    end
    case datatype
    when :noun
      case obj
      when /|value error:/
        result = @code
      when Fixnum
        if Timeout::Error == result
        else
          result = result.empty? ? nil : result = result.to_i
        end
      end
    when :copula
      case obj
      when /|syntax error/
        result = @code
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
  def copula obj
    resume :copula, obj
  end
end
