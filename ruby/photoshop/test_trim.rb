# test_trim
#                           wookay.noh at gmail.com

require 'photoshop'
require 'json'


def trim_png filename
  dir = Dir.pwd
  photoshop.load "#{dir}/#{filename}"
  doc = photoshop.current_document
  info = trim_doc doc
  info[:filename] = filename
  path = "trim_"+filename
  save_current_doc path
  open(path.gsub('.png','.txt'),'w') do |f|
    f.write info.to_json
  end
  photoshop.documents.close :saving => :no
end

photoshop.documents.close :saving => :no

def trim_all_png
  for filename in Dir["*.png"].reject{|x|x=~/^trim/}
    trim_png filename
    #history = doc.current_history_state.get
    #doc.current_history_state.set history
  end
end

trim_all_png
__END__
trim_png ARGV.to_s
