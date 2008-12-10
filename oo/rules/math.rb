class String
  def eval
    Fixnum.send :eval, self rescue self
  end
end
require "#{File.dirname __FILE__}/pol"
pol = Pol.new
pol.cook = 'eval'
pol.monad = %w{abs ceil chr class even? floor inspect integer? next nil? nonzero? odd? ord prec_f prec_i pred round size succ to_f to_i to_s zero?}
pol.dyad = %w{+ - * /}
pol.call ARGV
