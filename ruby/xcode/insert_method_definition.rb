#!/usr/bin/ruby
# insert method definition
#
# http://wookay.egloos.com
 

PBXFilePath = "%%%{PBXFilePath}%%%"
PBXSelectedText = '%%%{PBXSelectedText}%%%'

def get_header_path(path)
  dot = path.rindex('.')
  "#{path[0..dot]}h"
end
def get_impl_path(path)
  dot = path.rindex('.')
  "#{path[0..dot]}m"
end

def get_methods(sel)
  ary = []
  sel.split("\n").each do |l|
    signature = l.strip
    if ['-(','- ('].any? {|sign| signature.include? sign }
      ary.push signature.gsub('{','').gsub(';','').strip
    end
  end
  ary
end

def add_a_method_definition_to_interface implpath, selection
  headerpath = get_header_path(implpath)
  headertext = open(headerpath) {|f| f.read }
  indexCloseBracket = headertext.index('}')
  indexEnd = headertext.index('@end')
  methodText = headertext[indexCloseBracket..indexEnd]
  indexForMethod = nil
  if methodText.include? '-('
    indexForMethod = headertext.next_line_rindex('-(')
  elsif methodText.include? '- ('
    indexForMethod = headertext.next_line_rindex('- (')
  else
    if methodText.include? '@property'
      indexForMethod = headertext.next_line_rindex('@property')
    else
      indexForMethod = indexCloseBracket + 1
    end
  end
  methodsToPut = []
  get_methods(selection).each do |signature|
    if methodText.include? signature
    else
      methodsToPut.push %Q[#{signature} ;\n]
    end
  end
  if methodsToPut.size > 0
    preText = headertext[0..indexForMethod]
    backText = headertext[indexForMethod+1..-1]
    text = %Q[#{preText}#{methodsToPut.join""}#{backText}]
    file_replace_text headerpath, text
  end
end

def tell_xcode
  script = <<EOF
    tell application "Xcode"
    end tell
EOF
  system 'osascript', '-e', script
end
  
def file_replace_text path, to
  replaceFileContentsScript = <<REPLACEFILESCRIPT
    on run argv
      set fileAlias to POSIX file (item 1 of argv)
      set newDocText to (item 2 of argv)
      tell application "Xcode"
        set doc to open fileAlias
        set text of doc to newDocText
        save doc in file fileAlias
        tell application "System Events"
          keystroke "s" using {command down}
          keystroke "w" using {command down, shift down}
        end tell
      end tell
    end run
REPLACEFILESCRIPT
  system 'osascript', '-e', replaceFileContentsScript, path, to
end 
 
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

if PBXFilePath =~ /\.m/
  add_a_method_definition_to_interface PBXFilePath, PBXSelectedText
  tell_xcode
end
