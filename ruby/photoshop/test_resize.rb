# test_trim
#                           wookay.noh at gmail.com

require 'photoshop'
require 'json'

photoshop.documents.close :saving => :no

dir = Dir.pwd
for filename in Dir["*.png"].select{|x|x=~/^trim/}
  photoshop.load "#{dir}/#{filename}"
  doc = photoshop.current_document
  rate_x = 4.134375
  rate_y = 4.05625
  doc.resize_image :width => doc.width.get/rate_x,
                   :height => doc.height.get/rate_y
  path = filename.gsub('trim_','resize_')
  save_current_doc path
  photoshop.documents.close :saving => :no
end
