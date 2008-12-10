require "#{File.dirname __FILE__}/oo.rb"

class Array
  def find_funs monad, dyad, cook
    monad ||= []
    dyad ||= []
    ary = []
    (monad|dyad).each do |sym|
      ary.push sym if all? do |args,b|
        m = args.match /(.*)(#{POSTPOSITION_ADJECTIVE}) (.*)/
        if m
          next if monad.include? sym
          a, arg = m[1], m[3]
          if cook 
            a = a.send cook
            arg = arg.send cook
          end
          a.send(sym, arg).to_s==b if a.respond_to? sym
        else
          next if dyad.include? sym
          next if not args
          a = args
          a = a.send cook if cook
          a.send(sym).to_s==b if a.respond_to? sym
        end
      end
    end
    ary
  end
end

class Pol
  attr_accessor :monad
  attr_accessor :dyad
  attr_accessor :cook
  def initialize path=RULES_POL
    @path = path
  end
  def self.patterns_hash
    new.patterns_hash
  end
  def patterns_hash
    hash = Hash[patterns]
    hash[KEYWORD_ORDER] = patterns.transpose.first
    hash
  end
  def patterns
    ary = []
    ary = Array.send :eval, open(@path).read if File.exists? @path
    ary
  end
  def call argv
    return if argv.size==0
    obj = argv.join ' '
    if not patterns
      if cook
        print obj.send cook
      else
        print KEYWORD_NO
      end
      return
    end
    funs = patterns.find_funs monad, dyad, cook
    if funs.size.zero?
      if cook
        print obj.send cook
      else
        print KEYWORD_NO
      end
      return
    end
    case obj
    when /^#{KEYWORD_CODE}/
      a, b = patterns.last
      m = a.match /(.*)(#{POSTPOSITION_ADJECTIVE}) (.*)/
      if m
        a, arg = m[1], m[3]
        a = a.send cook if cook
        if a.class.to_s=="String"
          sa = "\"#{a}\""
        else
          sa = a
        end
        print funs.map{|fun| "#{sa}.#{fun}(#{arg})"}.join("\n")
      else
        a = a.send cook if cook
        if a.class.to_s=="String"
          sa = "\"#{a}\""
        else
          sa = a
        end
        print funs.map{|fun| "#{sa}.#{fun}"}.join("\n")
      end
    when /^#{KEYWORD_FUNCTION}/
      print funs.join', '
    when /^#{KEYWORD_INVERSE_FUNCTION}/
      funs = patterns.map{|a,b|[b,a]}.find_funs monad, dyad, cook
      if funs.size > 0 
        print funs.join', '
      else
        print KEYWORD_NO
      end
    else
      sym = funs.first
      m = obj.match /(.*)(#{POSTPOSITION_ADJECTIVE}) (.*)/
      if m
        a, arg = m[1], m[3]
        if cook 
          a = a.send cook
          arg = arg.send cook
        end
        print a.send(sym, arg) if dyad.include? sym
      else
        a = obj
        a = a.send cook if cook
        print a.send sym
      end
    end
  end
end
