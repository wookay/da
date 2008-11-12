# test_doc
#                           wookay.noh at gmail.com

require 'photoshop'

begin
  photoshop.documents.close :saving => :no
  $doc = photoshop.make :new => :document, :with_properties => {
                          :width => 320, :height => 620, :name => "test" }
  $lineToPrint = 5
  $passed = 0
  $failed = 0
end

assert_equal 'Adobe Photoshop' , photoshop.name.get
print_result
