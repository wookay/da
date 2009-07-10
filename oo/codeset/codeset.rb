# codeset.rb
#                           wookay.noh at gmail.com

require "#{File.dirname __FILE__}/function_compiler.rb"
require "#{File.dirname __FILE__}/patternizer"

def create_method name, &block
  self.class.send :define_method, name, &block
end

def method_of code, name
  create_method name, do |*a|
    puts code.output_format % (code.applicator.call *a).to_s
  end
end

class LazyObject
  def evaluation
    self.obj.send meth, arg
  end
end

class CodeSet
  attr_accessor :output_format
  attr_accessor :applicator

  def initialize &applicator
    self.applicator = applicator
  end

  def bang input, output
    functions = FunctionCompiler.new.compile input
    values = []
    functions.map do |function|
      args = []
      function.args.each do |arg|
        case arg
        when LazyObject
          args.push arg.evaluation
        else
          args.push arg
        end
      end
      values.push self.applicator.call *args
    end
    pattern = Patternizer.new functions.count, values, output
    self.output_format = pattern.format
    #function_name = functions.first.name
    #method_of self, function_name
  end
end
