# test_trim
#                           wookay.noh at gmail.com

require 'photoshop'
require 'json'

photoshop.documents.close :saving => :no

dir = Dir.pwd
for filename in Dir["*.png"].reject{|x|x=~/^trim/}
  photoshop.load "#{dir}/#{filename}"
  doc = photoshop.current_document
  info = trim_doc doc
  info[:filename] = filename
  path = "trim_"+filename
  save_current_doc path
  photoshop.documents.close :saving => :no
  open(path.gsub('.png','.txt'),'w') do |f|
    f.write info.to_json
  end
  #history = doc.current_history_state.get
  #doc.current_history_state.set history
end
