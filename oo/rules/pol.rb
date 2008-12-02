class Array
  def find_funs syms
    ary = []
    syms.each do |sym|
      ary.push sym if all? do |a,b|
        a.send(sym).to_s==b
      end
    end
    ary
  end
end

class Pol
  def initialize syms
    @syms = syms
  end
  def call argv
    return if argv.size==0
    file = "#{File.dirname __FILE__}/.pol"
    ary = eval(open(file).read) if File.exists? file
    funs = ary.find_funs @syms
    fun = funs.first if funs.size > 0
    return if not fun
    case argv.to_s
    when /^함수/
      print fun
    when /^역함수/
      funs = ary.map{|a,b|[b,a]}.find_funs @syms
      if funs.size > 0
        print funs
      else
        print "모르겠다"
      end
    else
      print argv.to_s.send(fun)
    end
  end
end
