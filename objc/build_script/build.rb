# build.rb
#                           wookay.noh at gmail.com

IPHONE_SDK = "3.1.2" if not defined? IPHONE_SDK

class Make
  def initialize out
    @out = "#{out}.out"
    @compiled = []
  end
  def cmd command
    puts command
    sh command
  end
  def should_compile? file
    obj = file.gsub('.m','.o').gsub('.c','.o')
    if File.exists? obj
      src_time = File.mtime file
      obj_time = File.mtime obj
      src_time > obj_time
    else
      true   
    end
  end
  def compile file, opt=''
    o = file.gsub('.m', '').gsub('.c','')
    if should_compile? file  
      cmd "/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.0 -c -x objective-c -arch i386 -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -fpascal-strings -fasm-blocks -O0 -Wreturn-type -Wunused-variable -D__IPHONE_OS_VERSION_MIN_REQUIRED=20000 -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator#{IPHONE_SDK}.sdk -fvisibility=hidden -mmacosx-version-min=10.5 -gdwarf-2 #{opt} #{file} -o #{o}.o"
    end
    @compiled.push "#{o}.o"
  end
  def link opt=''
    cmd "/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.0 -arch i386 -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator#{IPHONE_SDK}.sdk -mmacosx-version-min=10.5 -framework Foundation #{opt} -o #{@out} #{@compiled.join' '}"
  end
  def run
    cmd "./#{@out}"
  end
  def clean
    cmd "rm -f #{@out} #{@compiled.join' '}"
  end
end

def make out, &block
  desc out
  task out do
    block.call Make.new(out)
  end
end
