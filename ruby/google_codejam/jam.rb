# jam.rb
#                           wookay.noh at gmail.com

require 'stringio'
class Jam
  def initialize
    if ARGV.empty?
      @in = STDIN
    else
      @in = open ARGV.first
    end
  end 
  def feed rule=1
    dataset_size = @in.readline.to_i
    if 0==dataset_size
      puts "#{$0} < input_data"
    end
    1.upto dataset_size do |case_num|
      case rule
      when Fixnum
        lines_per_case = rule
        if 1==line_size_per_case
          yield case_num, @in.readline
        else
          lines = line_size_per_case.times.map { @in.readline }
          yield case_num, lines
        end
      when Proc
        yield case_num, rule.call(@in)
      end
    end
  end
  def input_data data
    @in = StringIO.new data
    self
  end
  def input_file filename
    @in = open filename
    self
  end
end
