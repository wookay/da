# alien_numbers.rb
#                           wookay.noh at gmail.com

class Alien
  def initialize digits
    @digits = digits
    @number_system = digits.size
  end
  def to_num str
    sum = 0
    str.split('').map{|x| @digits.index(x) }.reverse.each_with_index do |x, idx|
      sum += x * @number_system**idx
    end
    sum
  end
  def from_num alien_number
    ary = []
    num = alien_number
    loop do
      div, mod = num.divmod @number_system
      if div >= @number_system
        ary.push mod
        num = div
      else
        if ary.empty?
          ary.push mod
          ary.push div if div > 0
        else
          ary.push mod
          ary.push div
        end
        break
      end
    end 
    ary.reverse.map{|x| @digits[x] }.join
  end
end

def translate alien_number, source_language, target_language
  source = Alien.new source_language
  target = Alien.new target_language
  target.from_num source.to_num(alien_number)
end



if __FILE__ == $0
  require 'jam'
  jam = Jam.new
  jam.feed do |case_num, line|
    a,s,t = line.split ' '
    puts "Case ##{case_num}: #{translate(a,s,t)}"
  end
end
