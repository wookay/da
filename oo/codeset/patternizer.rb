# patternizer.rb
#                           wookay.noh at gmail.com

require 'diff/lcs' # gem install diff-lcs
require 'set'

module Enumerable
  def group_by_sequence
    agg = []
    inject(0) do |last_one, obj|
      this_one = yield obj
      if last_one+1 == this_one
        agg.last.push obj
      else
        agg.push [obj]
      end
      this_one
    end
    agg
  end
end

class Patternizer
  attr_accessor :format
  def solve_char_group size, values, text
  end
  def solve_single_line size, values, text
    solve_each_group size, values, text.lines.to_a
  end
  def solve_multi_lines size, values, text
    solve_each_group size, values,
      text.lines.enum_for(:each_slice, text.lines.count/size).to_a.map{|a|a.join}
  end
  def solve_each_group size, values, group
    output_array = []
    matched_index = []
    group.each_cons 2 do |one, two|
      part_same, part_diff =
        Diff::LCS.sdiff(one, two).partition {|change| '='==change.action }
      parts = 
        part_same.group_by_sequence{|change| change.new_position} +
        part_diff.group_by_sequence{|change| change.new_position}
      sorted_parts = parts.sort_by{|a| a.first.new_position}
      if output_array.empty?
        matched_index.push part_diff.map{|change|change.old_element} == "#{values.fetch output_array.count}"
        output_array.push sorted_parts#.map{|ar|ar.map{|c|c.old_element}.join}
      end
      matched_index.push part_diff.map{|change|change.new_element}.join == "#{values.fetch output_array.count}"
      output_array.push sorted_parts#.map{|ar|ar.map{|c|c.new_element}.join}
    end

    ret_ary = []
    index_found = matched_index.index true
    if index_found
      sorted_parts = output_array[index_found]
      ary = []
      sorted_parts.each do |ar|
        if "="==ar.first.action
          ary.push ar.map{|c|c.new_element}
        else
          ary.push "%s"
        end
      end
      self.format = ary.join''
      matched_index.each_with_index do |matched, idx|
        if matched
          ret_ary.push output_array[idx]
        else
          one = group[idx]
          two = group[index_found]
          part_same, part_diff =
            Diff::LCS.sdiff(one, two).partition {|change| '='==change.action }
          parts = 
            part_same.group_by_sequence{|change| change.new_position} +
            part_diff.group_by_sequence{|change| change.new_position}
          sorted_parts = parts.sort_by{|a| a.first.new_position}
          ret_ary.push sorted_parts.map{|ar|ar.map{|c|c.old_element}.join}
        end
      end
    end
    ret_ary
  end

  def initialize size, values, text
    line_count = text.lines.count
    if size==line_count
      solve_single_line size, values, text
    elsif size > text.lines.count
      solve_char_group size, values, text
    else
      solve_multi_lines size, values, text
    end
  end
end
