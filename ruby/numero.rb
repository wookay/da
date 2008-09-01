# Numero
#                           wookay.noh at gmail.com

NUMERO = %w{zero one two three four five six seven eight nine ten}

class Fixnum
  def to_symbol
    NUMERO.at(self).to_sym
  end

  def self.numero_methods ops, opt
    require 'md5'
    for op in ops
      m = "m#{MD5::md5 op.to_s}"
      class_eval <<-EOF
        alias :#{m} #{op}
        def #{op} a
          case a.class.to_s
          when 'Symbol'
            (#{m} a.to_num)#{opt}
          else
            #{m} a
          end
        end
      EOF
    end
  end
  numero_methods %w{== > >= < <=}, nil 
  numero_methods %w{+ - * /}, '.send :to_symbol'
end

class Symbol
  def to_num
    NUMERO.index to_s
  end

  def numero op, a
    case a.class.to_s
    when 'Symbol'
      to_num.send op, a.to_num
    else
      to_num.send op, a
    end
  end

  def self.numero_methods ops, opt
    for op in ops
      class_eval <<-EOF
        def #{op} a
          numero('#{op}', a)#{opt}
        end
      EOF
    end
  end
  numero_methods %w{== > >= < <=}, nil 
  numero_methods %w{+ - * /}, '.send :to_symbol'
end

def assert_equals expected, got
  puts expected == got
end


assert_equals :six, :one + :two + :three
assert_equals :six, :one * :two * :three
assert_equals true, :one + :two == :three
assert_equals true, :one < :two
assert_equals 3, :one + :two
assert_equals :six, 1 + 2 + 3
assert_equals :six, 1 + 2 + :three
