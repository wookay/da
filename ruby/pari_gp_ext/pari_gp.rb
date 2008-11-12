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



class Polpattern
  def initialize xa, ya
    x_max = xa.map{|x|x.size}.max
    y_max = ya.map{|y|y.size}.max
    @xa = abcissas xa, x_max
    @ya = abcissas ya, y_max
    feed xa.zip(ya).map{|x,y|"#{x.ljust x_max}|#{y.ljust y_max}|"}.to_s
  end
  def abcissas ary, m
    ary.map do |a|
      if ary.select{|x| x.match a}.size==1
        a
      else
        a.ljust m
      end
    end.uniq
  end
  def feed data
    hx = {}
    hy = {}
    ary = @xa.zip(@ya).map do |x, y|
      dx = data.index x
      dy = data.index y
      hx[x] = dx
      hy[dy] = y
      [dx, dy]
    end
    aryt = ary.transpose
    @polxy = polinterpolate *aryt
    @polyx = polinterpolate aryt[1], aryt[0]
    @hx = hx
    @hy = hy
    @data = data
  end
  def [] v
    @polxy[v]
  end
  def value opt
    key = opt[:key]
    vx = @hx[key]
    if vx
      @hy[@polxy[vx]]
    else
      dx = @data.index(key) || 0
      pdx = @polxy[dx] || 0
      @data[pdx, (pdx-dx).abs].scan(/\w/).to_s
    end
  end
  def key opt
    value = opt[:value]
    vy = @hy.invert[value]
    if vy
      @hx.invert[@polyx[vy]]
    else
      dy = @data.index(value) || 0
      pdy = @polyx[dy] || 0
      @data[pdy, (pdy-dy).abs].scan(/\w/).to_s
    end
  end
end

def polpattern xa, ya
  Polpattern.new xa, ya
end
