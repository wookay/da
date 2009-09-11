# rub.rb
#                           wookay.noh at gmail.com

require 'fiber'
require 'timeout'

LF = "\n"

class Worker
  def initialize
    @timeout = 0.1
    @code = ''
  end
  def feed datatype, obj
    token = "#{obj} "
    @code.concat token
    result = nil
    begin
      status = Timeout::timeout @timeout do
        result = eval @code
      end
      case datatype
      when :object
        case obj
        when Fixnum
          result = result.to_i
        end
      end
    rescue SyntaxError => e
      result = @code
    rescue Exception => e
      result = e.class
    end
    result
  end
end

class Rub < Fiber
  def initialize
    super do |datatype, obj|
      worker = Worker.new
      loop do
        result = worker.feed datatype, obj
        datatype, obj = Fiber.yield result
      end
    end
  end
  def keyword obj
    resume :keyword, obj
  end
  def object obj
    resume :object, obj
  end
  def send obj
    resume :method, obj
  end
  def LF
    resume :syntax, LF
  end
end
