# always_turn_left.rb
#                           wookay.noh at gmail.com

class Position
  attr_reader :x, :y
  def initialize x, y
    @x = x
    @y = y
  end
  def to_a
    [@x, @y]
  end
  def move direction
    case direction
    when :north
      @y -= 1
    when :south
      @y += 1
    when :west
      @x -= 1
    when :east
      @x += 1
    end
  end
end

class Body
  attr_reader :direction
  def initialize direction
    @direction = direction
  end
  def turn to
    case @direction
    when :north
      @direction = :left == to ? :west : :east
    when :south
      @direction = :left == to ? :east : :west
    when :west
      @direction = :left == to ? :south : :north
    when :east
      @direction = :left == to ? :north : :south
    end
  end
end

class Space
  attr_reader :position
  def initialize
    @body = Body.new :south
    @position = Position.new 0, 0
    @doors = {}
    @entrance = @position.to_a
  end
  def walk steps
    steps.split('').each do |step|
      go step
    end
    self
  end
  def go step
    case step
    when 'W'
      open_door @body.direction
      @position.move @body.direction
    when 'R'
      @body.turn :right
    when 'L'
      close_door @body.direction
      @body.turn :left
    end
    self
  end
  def back
    @exit = @position.to_a
    @body.turn :right
    @body.turn :right
    self
  end
  def trace_wall
    hash = @doors.reject{|x| x==@entrance or x==@exit }
    row = hash.keys.map{|x,y| y }
    col = hash.keys.map{|x,y| x }
    ret = []
    row.min.upto row.max do |y|
      ary = []
      col.min.upto col.max do |x|
        can = hash[[x,y]]
        if can
          north = can[:north] || 0
          south = can[:south] || 0
          west = can[:west] || 0
          east = can[:east] || 0
          ary.push (north + south*2 + west*4 + east*8).to_s(16)
        else
          raise :error
        end
      end
      ret.push ary.join
    end
    ret
  end

  private
  def open_door direction
    if @doors[@position.to_a]
      if nil==@doors[@position.to_a][direction]
        @doors[@position.to_a][direction] = 1
      elsif 0==@doors[@position.to_a][direction]
        @doors[@position.to_a][direction] = 1
      end
    else
      hash = Hash.new nil
      hash[direction] = 1
      @doors[@position.to_a] = hash
    end
  end
  def close_door direction
    if @doors[@position.to_a]
      if nil==@doors[@position.to_a][direction]
        @doors[@position.to_a][direction] = 0
      end
    else
      hash = Hash.new nil
      hash[direction] = 0
      @doors[@position.to_a] = hash
    end
  end
end

def translate entrance_to_exit, exit_to_entrance
  space = Space.new
  space.walk entrance_to_exit
  space.back
  space.walk exit_to_entrance
  space.trace_wall
end



if __FILE__ == $0
  require 'jam'
  jam = Jam.new
  jam.feed do |case_num, line|
    en,ex = line.split ' '
    puts <<EOF
Case ##{case_num}:
#{translate(en, ex).join("\n")}
EOF
  end
end
