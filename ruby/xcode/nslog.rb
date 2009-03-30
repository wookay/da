#!/usr/bin/ruby
# NSLog
#
# http://wookay.egloos.com
 
PBXFilePath = "%%%{PBXFilePath}%%%"
PBXSelectedText = '%%%{PBXSelectedText}%%%'
PBXSelectionStart = '%%%{PBXSelectionStart}%%%'
PBXSelectionEnd = '%%%{PBXSelectionEnd}%%%'

class String
  def next_line_index text
    idx = self.index(text)
    idx + self[idx..idx+100].index("\n")
  end
  def next_line_rindex text
    idx = self.rindex(text)
    idx + self[idx..-1].index("\n")
  end
end

def get_type_from_signature(var, l)
  idx = l.rindex(var)
  idxOpen = l[0..idx].rindex('(')
  idxClose = l[0..idx].rindex(')')
  type = l[idxOpen..idxClose].gsub('(','').gsub(')','')
  if type=='id' or type.include? '*'
    ['@', var]
  elsif type=='int'
    ['d', var]
  elsif type=='float'
    ['g',var]
  elsif type=='CGRect'
    ['@', "NSStringFromCGRect(#{var})"]
  end
end
def get_type_from_variable(var, l)
end

def get_type_var(filePath, selectedText, selectionEnd)
  alltext = open(filePath) { |f| f.read }
  type = '@'
  var = selectedText.strip
  alltext[0..selectionEnd.to_i].split("\n").reverse.each do |l|
    if l.include? ")#{var}" or l.include? ") #{var}"
      type,var = get_type_from_signature(var, l)
      break
    elsif l.include? " #{var}"
      type,var = get_type_from_variable(var, l)
      break  
    end
  end
  [type,var]
end


if PBXFilePath =~ /\.m/
  type,var = get_type_var(PBXFilePath, PBXSelectedText, PBXSelectionEnd)
  puts %Q_NSLog(@"%#{type}", #{var});\n_
end
