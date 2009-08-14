module Step
  def step_in_circular var, step, range
    value = send var
    value += step
    if step > 0
      if value > range.max
        value = range.min
      end
    else
      if value < range.min
        value = range.max
      end
    end
    send "#{var}=", value
  end
  def step_in_bound var, step, range
    @direction = step>0 ? :up : :down if not @direction
    value = send var
    case @direction
    when :up
      value += step
      if value > range.max
        value = range.max
        @direction = :down
      end
    when :down
      value -= step
      if value < range.min
        value = range.min
        @direction = :up
      end
    end
    send "#{var}=", value
  end
end

class Vector3 < Struct.new :x, :y, :z
  include Step
end
class Angle < Struct.new :degree
  include Step
end
