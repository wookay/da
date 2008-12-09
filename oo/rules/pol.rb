require "#{File.dirname __FILE__}/oo.rb"

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
  def self.mappings_hash
    hash = Hash[mappings]
    hash[KEYWORD_ORDER] = mappings.transpose.first
    hash
  end
  def self.mappings
    file = "#{File.dirname __FILE__}/.pol"
    ary = []
    ary = Array.send :eval, open(file).read if File.exists? file
    ary
  end
  def call argv
    return if argv.size==0
    funs = Pol.mappings.find_funs @syms
    return if not funs.size > 0
    case argv.to_s
    when /^#{KEYWORD_CODE}/
      a, b = Pol.mappings.first
      print funs.map{|fun| "\"#{a}\".#{fun}"}.join("\n")
    when /^#{KEYWORD_FUNCTION}/
      print funs.join', '
    when /^#{KEYWORD_INVERSE_FUNCTION}/
      funs = Pol.mappings.map{|a,b|[b,a]}.find_funs @syms
      if funs.size > 0 
        print funs.join', '
      else
        print KEYWORD_NO
      end
    else
      print argv.to_s.send(funs.first)
    end
  end
end
