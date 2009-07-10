# function_compiler.rb
#                           wookay.noh at gmail.com

CompiledFunction = Struct.new :name, :arity, :args
LazyObject = Struct.new :obj, :meth, :arg

class FunctionCompiler
  def nothing *a
  end
  alias trace :nothing
  alias pop :nothing
  alias leave :nothing
  def initialize
    @stack = []
  end
  def putnil
    @stack.push nil
  end
  def putobject obj
    @stack.push obj
  end
  def putstring obj
    @stack.push String.new(obj)
  end
  def opt_eq obj
    infix '=='
  end
  def opt_div
    infix '/'
  end
  def opt_mult
    infix '*'
  end
  def opt_plus
    infix '+'
  end
  def opt_minus
    infix '-'
  end
  def duparray ary
    Array.new(ary).each do |obj|
      @stack.push obj
    end
  end
  def infix meth
    arg = @stack.pop
    obj = @stack.pop
    @stack.push LazyObject.new(obj, meth, arg)
  end
  def compile code
    compiled_functions = []
    iseq = RubyVM::InstructionSequence.compile code
    iseq.to_a.last.each do |inst|
      case inst
      when Array
        if :send == inst.first
          arity = inst[2]
          args = []
          arity.times { args.insert 0, @stack.pop }
          compiled_functions.push CompiledFunction.new(inst[1], arity, args)
        else
          self.send *inst
        end
      end
    end
    compiled_functions
  end
end
