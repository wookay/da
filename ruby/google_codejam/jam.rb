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
  def feed line_per_case=1
    dataset_size = @in.readline.to_i
    if 0==dataset_size
      puts "#{$0} < input_data"
    end
    1.upto dataset_size do |case_num|
      if 1==line_per_case
        yield case_num, @in.readline
      else
        ary = []
        line_per_case.times { ary.push @in.readline }
        yield case_num, ary
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
  def act
    feed do |case_num, line|
      puts "Case ##{case_num}:"
      ary = line.split(' ')
      translate(*ary).each do |result|
        puts result
      end
    end
  end
end
