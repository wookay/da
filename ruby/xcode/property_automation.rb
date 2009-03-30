#!/usr/bin/ruby
# property automation
#
# http://wookay.egloos.com

selectionStart = "%%%{PBXSelectionStart}%%%"
selectionEnd = "%%%{PBXSelectionEnd}%%%"
alltext = "%%%{PBXAllText}%%%"
selection = alltext[selectionStart.to_i..selectionEnd.to_i]

headerpath = "%%%{PBXFilePath}%%%"
headertext = alltext
implpath = headerpath.gsub(/\.h$/,'.m')
impltext = open(implpath) { |f| f.read }

def file_replace_text path, to
  replaceFileContentsScript = <<REPLACEFILESCRIPT
    on run argv
      set fileAlias to POSIX file (item 1 of argv)
      set newDocText to (item 2 of argv)
      tell application "Xcode"
        set doc to open fileAlias
        set text of doc to newDocText
        save doc in file fileAlias
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

def prop_of decl
  a,_ = decl.split(' ')
  if a == 'id' or a.include? '*'
    ', retain'
  end
end

def get_declations sel
  ary = []
  sel.split("\n").each do |l|
    decl = l.strip
    if decl.size > 0
      if decl.include? '}' or decl.include? '@interface'
      else
        ary.push decl
      end
    end
  end
  ary
end

def push_properties headerpath, headertext, selection
  indexCloseBracket = headertext.index('}')
  indexEnd = headertext.index('@end')
  methodText = headertext[indexCloseBracket..indexEnd]
  indexForProperty = nil
  if methodText.include? '@property'
    indexForProperty = headertext.next_line_rindex('@property')
  else
    indexForProperty = indexCloseBracket
  end
  propertiesToPut = []
  get_declations(selection).each do |decl|
    if methodText.include? decl
    else
      prop = prop_of decl
      if prop
        outlet = "IBOutlet"
      else
        outlet = "                "                                          
      end
      propertiesToPut.push %Q[\n@property (nonatomic#{prop}) #{outlet} #{decl}]
    end
  end
  if propertiesToPut.size > 0
    preText = headertext[0..indexForProperty]
    backText = headertext[indexForProperty+1..-1]
    text = %Q[#{preText}#{propertiesToPut.join""}#{backText}]
    file_replace_text headerpath, text
  end
end

def push_synthesize_release implpath, impltext, selection
  indexOfDealloc = impltext.next_line_rindex('dealloc {')
  releaseText = impltext[indexOfDealloc..-1]  
  synthesizeText = impltext.split("\n").select {|l| l.include? 'synthesize'}.join("\n")
  indexForSynthesize = nil
  if synthesizeText.include? '@synthesize'
    indexForSynthesize = impltext.next_line_rindex('@synthesize')
  else
    indexForSynthesize = impltext.next_line_rindex('@implementation')
  end
  indexForRelease = nil
  if releaseText.include? 'release]'
    indexForRelease = impltext.next_line_rindex('release]')
  else
    indexForRelease = impltext.next_line_rindex('dealloc {')
  end
  synthesizesToPut = []
  releasesToPut = []
  get_declations(selection).each do |decl|
    prop = prop_of decl
    name = decl.split(' ').last.gsub(';','')
    if synthesizeText.include? "@synthesize #{name};"
    else
      synthesizesToPut.push "@synthesize #{name};\n"
    end
    if releaseText.include? "[#{name} release];"
    else
      if prop
        releasesToPut.push "    [#{name} release];\n"
      end
    end
  end
  if synthesizesToPut.size > 0 or releasesToPut.size > 0
    preText = impltext[0..indexForSynthesize]
    backText = impltext[indexForSynthesize+1..indexForRelease]
    tailText = impltext[indexForRelease+1..-1]
    text = %Q[#{preText}#{synthesizesToPut.join""}#{backText}#{releasesToPut.join""}#{tailText}]
    file_replace_text implpath, text
  end
end

push_synthesize_release(implpath, impltext, selection)
push_properties(headerpath, headertext, selection)
