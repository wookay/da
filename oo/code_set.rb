require 'function_compiler'
require 'patternizer'
require 'pol'

class LazyObject
  def evaluation
    self.obj.send meth, arg
  end
end

class CodeSet
  def initialize myself, &applicator
    @myself = myself
    @applicator = applicator
    @function = nil
  end
  def bang input, output
    functions = FunctionCompiler.new.compile input
    pat = Patternizer.new functions.count, output
    applicable functions, pat
  end

  def get_function
    applicator = @applicator
    create_method @function, do |*a|
      if applicator
        puts "passed: #{applicator.call *a}"
      else
        puts "passed: ok"
      end
    end
  end

  def create_method name, &block
    @myself.class.send :define_method, name, &block
  end

  private
  def applicable functions, pat
    set = Set.new
    set.add functions.map do |function|
      args = []
      function.args.each do |arg|
        case arg
        when LazyObject
          args.push arg.evaluation
        else
          args.push arg
        end
      end
      @applicator.call *args
    end
    @function = set.to_a.first.first.name
    #meth = :assert_equal #self.create_method :assert_equal, &applicator
    #Pol.new(meth, applicator).method(:assert_equal)
  end
end

def code_set &block
  CodeSet.new self, &block
end
