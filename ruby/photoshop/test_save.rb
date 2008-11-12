# test_photoshop.rb
#                           wookay.noh at gmail.com

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

require 'rubygems'
require 'appscript'
include Appscript

begin
  photoshop = app 'Adobe photoshop CS3'
  photoshop.documents.close :saving => :no
  $doc = photoshop.make :new => :document, :with_properties => {
                          :width => 320, :height => 620, :name => "test" }
  $lineToPrint = 5
  $passed = 0
  $failed = 0
end


def save filename
  scpt = 'save.scpt'
  open scpt, 'w' do |f|
    f.write <<EOF
tell application "Adobe Photoshop CS3"
  activate
  --set display dialogs to never
  set newFileName to "#{filename}"
  set myOptions to { class:PNG save options }--, quality:1 }
  save current document in file newFileName as PNG with options myOptions appending lowercase extension without copying
end tell
EOF
  end
  `osascript #{scpt} ; rm #{scpt}`
end

assert_equal 'Adobe Photoshop' , photoshop.name.get
print_result

$doc.art_layers.get[0..-1].each { |layer| layer.visible.set false }

$doc.art_layers.get[0..-1].each do |layer|
  puts layer.name.get
  layer.visible.set true
  filename = Dir.pwd+"/test_#{layer.name.get.gsub(':','')}.png"
  save filename
  layer.visible.set false
end
