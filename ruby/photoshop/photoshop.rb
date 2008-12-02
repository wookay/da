# photoshop.rb
#                           wookay.noh at gmail.com

require 'rubygems'
require 'appscript'
include Appscript

def photoshop
  app 'Adobe photoshop CS3'
end

def assert_equal expected, got
  case expected == got
  when true
    print_to_photoshop "passed: #{expected}"
    $passed += 1
  else
    print_to_photoshop "Assertion failed"
    print_to_photoshop "Expected: #{expected}"
    print_to_photoshop "Got: #{got}"
    $failed += 1
  end
end

def print_to_photoshop message, opt={}
  layer = $doc.make :new => :art_layer
  layer.kind.set :text_layer
  layer.text_object.stroke_color.red.set opt[:red] if opt[:red]
  layer.text_object.stroke_color.green.set opt[:green] if opt[:green]
  layer.text_object.stroke_color.blue.set opt[:blue] if opt[:blue]
  layer.text_object.size.set 18
  layer.text_object.position.set [5, $lineToPrint+=layer.text_object.size.get]
  layer.text_object.contents.set message
end

def print_result
  if $passed==1
    print_to_photoshop "OK, passed 1 test.", :green => 255
  elsif $passed>1
    print_to_photoshop "OK, passed #{$passed} tests.", :green => 255
  end
  if $failed==1
    print_to_photoshop "Oops, failed 1 test.", :red => 255
  elsif $failed>1
    print_to_photoshop "Oops, failed #{$failed} tests.", :red => 255
  end
end

def save_current_doc filename, dir=Dir.pwd
  path = "#{dir}/#{filename}"
  scpt = 'save.scpt'
  open scpt, 'w' do |f|
    f.write <<EOF
tell application "Adobe Photoshop CS3"
  activate
  set display dialogs to never
  set newFileName to "#{path}"
  set myOptions to { class:PNG save options }--, quality:1 }
  save current document in file newFileName as PNG with options myOptions appending lowercase extension without copying
end tell
EOF
  end
  `osascript #{scpt} ; rm #{scpt}`
end

def hide_layers layers
  layers.each do |layer|
    layer.visible.set false
  end
end

def show_layer_set layer_set
  layer_set.visible.set true
  layer_set.layers.get.each do |layer|
    layer.visible.set true
  end
end

def save_layers layers, prefix='test'
  layers.each do |layer|
    save_layer layer, prefix
  end
end

def save_layer layer, prefix='test'
  puts layer.name.get
  layer.visible.set true
  save_current_doc "#{prefix}_#{layer.name.get.gsub(':','')}.png"
  layer.visible.set false
end

def trim_side doc, side
  w = doc.width.get
  h = doc.height.get
  opt = { :top_trim => false, :bottom_trim => false, :right_trim => false, :left_trim => false }
  opt[side] = true
  opt[:basing_trim_on] = :transparent_pixels
  doc.trim opt
  [w - doc.width.get, h - doc.height.get]
end

def trim_doc doc
  info = {}
  info[:before] = [doc.width.get, doc.height.get]
  left,x = trim_side doc, :left_trim
  x,top = trim_side doc, :top_trim
  right,x = trim_side doc, :right_trim
  x,bottom = trim_side doc, :bottom_trim
  info[:trim] = [left, top, right, bottom]
  info[:after] = [doc.width.get, doc.height.get]
  info
end
