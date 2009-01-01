# test_trim
#                           wookay.noh at gmail.com

require 'photoshop'
require 'json'

photoshop.documents.close :saving => :no

def trim_doc_bottom doc
  info = {}
  info[:before] = [doc.width.get, doc.height.get]
  right,x = trim_side doc, :right_trim
  x,bottom = trim_side doc, :bottom_trim
  info[:trim] = [0, 0, right, bottom]
  info[:after] = [doc.width.get, doc.height.get]
  info
end

dir = Dir.pwd
for filename in Dir["*.png"].reject{|x|x=~/^trim/}
  photoshop.load "#{dir}/#{filename}"
  doc = photoshop.current_document
  info = trim_doc_bottom doc
  info[:filename] = filename
  path = "trim_"+filename
  save_current_doc path
  photoshop.documents.close :saving => :no
  open(path.gsub('.png','.txt'),'w') do |f|
    f.write info.to_json
  end
end
