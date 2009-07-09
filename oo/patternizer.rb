require 'diff/lcs' # gem install diff-lcs
require 'set'
require 'pol'

class Patternizer
  attr_accessor :format
  attr_accessor :values
  def solve_char_group size, text
  end
  def solve_single_line size, text
    solve_each_group size, text.lines
  end
  def solve_multi_line size, text
  end
  def solve_each_group size, group
    format = []
    values = []
    group.each_cons 2 do |a, b|
      diff = Diff::LCS.sdiff a, b
      match = []
      not_match = []
      diff.each do |change|
        case change.action
        when '='
          match.push change
        else
          not_match.push change
        end
      end
      format = format.empty? ? match : format & match
      if values.empty?
        values.push not_match.map{ |change| change.old_element}.join
      end
      values.push not_match.map{ |change| change.new_element}.join
    end
    @format = format.map{ |change| change.new_element}.join
    @values = values
  end
  def initialize size, text
    line_count = text.lines.count
    if size==line_count
      solve_single_line size, text
    elsif size > text.lines.count
      solve_char_group size, text
    else
      solve_multi_lines size, text
    end
  end
end
