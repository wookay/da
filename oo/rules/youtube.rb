require 'open-uri'
data = open(ARGV.to_s).read
m = data.match /swfArgs.* "video_id": "([\w\-]*)".* "t": "([\w\-_=]*)"/
if m
  url = "http://youtube.com/get_video.php?video_id=#{m[1]}&t=#{m[2]}"
  title = data.match /"title" content="(.*)"/
  file = title[1].strip.tr(%q{~!@#$%^&*+`={}|\:";'<>?,/}, '')
  print %Q(wget --output-document="#{file}.flv" "#{url}")
end
