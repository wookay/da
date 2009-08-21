# egg_drop.rb
#                           wookay.noh at gmail.com

def translate floors, drop_eggs, break_eggs
  []
end

if __FILE__ == $0
  require 'jam'
  jam = Jam.new
  jam.feed do |case_num, line|
    f,d,b = line.split ' '
    puts "Case ##{case_num}: #{translate(f,d,b)}"
  end
end
