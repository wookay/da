# build.rb
#                           wookay.noh at gmail.com

class Make
  def initialize out
    @out = "#{out}.out"
    @compiled = []
  end
  def compile file, opt=''
    o = file.gsub('.m', '').gsub('.c','')
    sh "/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.0 -c -x objective-c -arch i386 -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -fpascal-strings -fasm-blocks -O0 -Wreturn-type -Wunused-variable -D__IPHONE_OS_VERSION_MIN_REQUIRED=20000 -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk -fvisibility=hidden -mmacosx-version-min=10.5 -gdwarf-2 #{opt} #{file} -o #{o}.o"
    @compiled.push "#{o}.o"
  end
  def link opt=''
    sh "/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.0 -arch i386 -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk -mmacosx-version-min=10.5 -framework Foundation #{opt} -o #{@out} #{@compiled.join' '}"
  end
  def run
    sh "./#{@out}"
  end
  def clean
    sh "rm -f #{@out} #{@compiled.join' '}"
  end
end

def make out, &block
  desc out
  task out do
    block.call Make.new(out)
  end
end
