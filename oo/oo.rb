exit unless RUBY_VERSION.to_f >= 1.9

require 'function_converter'

class UndefinedFunction
  def match line
    ret = []
    case arity
    when 2
      lhs = args[0]
      rhs = args[1]
      lhs.methods.select{|meth| lhs.method(meth).arity == 1}.each do |meth|
        begin
          puts "#{lhs.send(meth, rhs)}"
          if line =~ /#{lhs.send(meth, rhs)}/
            ret.push meth
          end
        rescue
          nil
        end
      end
    end
    ret
  end
end
class LazyObject
  def evaluation
    obj.send op, args
  end
end

class CodeSet
  
end


code = CodeSet.new
code.generate <<INPUT, <<OUTPUT

INPUT

OUTPUT




class Oo
  attr_accessor :code
  def generate options
    output = options[:output]
    builder = SyntaxBuilder.new
    iseq = RubyVM::InstructionSequence.compile code
    functions = builder.load_iseq iseq
    matched = Hash.new 0
    output_lines = output.lines.to_a
    output_lines_count = output_lines.count
    functions.each_with_index do |function, idx|
      line = output_lines[idx]
      m = function.match line
      if m.size > 0
        puts m#matched[m.method_name] += 1
      end
    #output_lines.each_with_index do |line, idx|
    #  function = functions[idx]
      #  item = element[idx]
      #  case item
      #  when UndefinedMethod
      #    item.match_with line
      #    #matched[element_idx] += 1 if line.match /#{element[idx]}/
      #  else
      #    matched[element_idx] += 1 if line.match /#{item}/
      #  end
      #end
    end
    #matched_all = matched.select { |row, count| output_lines_count == count }
    #if matched_all.size > 0
    #  #puts matched_all.keys 
    #else
    #  matched_all = matched.select { |row, count| output_lines_count == count }
    #end
    #funs
  end
end

pol = Oo.new
pol.code = <<EOF
assert_equal(1, 1)
assert_equal(3, 1+2)
assert_equal("a", "a")
assert_equal(true, 1==1)
EOF

#fun = pol.interpolate :output => <<EOF
#passed: 1
#passed: 3
#passed: a
#passed: true
#EOF
#puts fun

fun = pol.interpolate :output => <<EOF
passed: true
passed: true
passed: true
passed: true
EOF
#puts fun
#fun(1, 3)
__END__
    functions.each do |function, *args|
      case function.arity
      when 2
        obj = args[0]
        arg = args[1]
        case arg
        when LazyObject
          arg = arg.eval
        end
        arg_value = 
        obj.methods.select{|meth| obj.method(meth).arity == 1}.each do |meth|
          begin
            if obj.send(meth, arg)
              puts meth
            end
          rescue
            nil
          end
        end
      end
    end
