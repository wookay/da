# rub.rb
#                           wookay.noh at gmail.com

require 'fiber'

class Worker
  def initialize
    @code = ''
  end
  def feed datatype, obj
    token = "#{obj}"
    @code.concat token
    begin
      result = eval @code
    rescue Exception => e
      result = e.class
    end
    case datatype
    when :object
      case obj
      when Fixnum
        result = result.to_i
      end
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
  def object obj
    resume :object, obj
  end
  def send obj
    resume :method, obj
  end
end
