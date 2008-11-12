# test_photoshop.rb
#                           wookay.noh at gmail.com

def save filename
  scpt = 'save.scpt'
  open scpt, 'w' do |f|
    f.write <<EOF
tell application "Adobe Photoshop CS3"
  set display dialogs to never
  set newFileName to "#{filename}"
  set myOptions to { class:PNG save options, quality:1 }
  save current document in file newFileName as PNG with options myOptions appending lowercase extension without copying
end tell
EOF
  end
  `osascript #{scpt} ; rm #{scpt}`
end

require 'rubygems'
require 'appscript'
include Appscript

photoshop = app 'Adobe photoshop CS3'
doc = photoshop.current_document
photoshop.activate
#doc.art_layers.get.each { |layer| layer.visible.set false }
#w = doc.width.get
#h = doc.height.get
#puts [w,h]
#layer = doc.art_layers.get[1]
#layer.visible.set true
if doc.histogram.get.first > 0
  #doc.trim
  puts photoshop.current_document.get
  name = 'test' #{layer.name.get}
  filename = Dir.pwd+"/#{name}.png"
  save filename
  #File.delete filename
end
