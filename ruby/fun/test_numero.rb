# test_numero.rb
#                           wookay.noh at gmail.com

NUMERO = %w{zero one two three four five six seven eight nine ten}

class Fixnum
  def to_symbol
    NUMERO.at(self).to_sym
  end

  def self.numero_methods ops, opt
    require 'digest/md5'
    for op in ops
      m = "m#{Digest::MD5.hexdigest op}"
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

def assert_equal expected, got
  case expected == got
  when true
    puts "passed: #{expected}"
  else
    puts "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  end
end

assert_equal :six , :one + :two + :three
assert_equal :six , :one * :two * :three
assert_equal true , :one + :two == :three
assert_equal true , :one < :two
assert_equal 3    , :one + :two
assert_equal :six , 1 + 2 + 3
assert_equal :six , 1 + 2 + :three
