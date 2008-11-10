# pari_gp.rb
#                           wookay.noh at gmail.com

require 'pari_gp_ext'

class Pol
  def initialize xa, ya
    if not ya
      ya = xa
      xa = (1..(xa.size)).to_a
    end
    @pol = gp_eval "x -> polinterpolate(#{xa.inspect}, #{ya.inspect}, x)"
  end

  def [] v
    case v.class.to_s
    when 'Range'
      v.map { |x| eval gp_eval("(#{@pol})(#{x})") }
    when 'Fixnum'
      eval gp_eval("(#{@pol})(#{v})")
    when 'String'
      gp_eval "(#{@pol})(#{v})"
    end
  end
end

def polinterpolate xa, ya=nil
  Pol.new xa, ya
end
