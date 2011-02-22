# build.rake
#                           wookay.noh at gmail.com

IPHONE_SDK = "4.2"

DEPLOY="/deploy/var/mobile/"

def cmd command
  puts command
  sh command
end

if defined? DIR
  APP=DIR.split('/').last
  TEST_CLASSES=Dir["#{DIR}/*.m"].select{|t| t=~/Test/}.map{|t|t.split('/').last}
  UNITTEST_CLASSES = %w{Inspect Logger UnitTest NSStringExt NSNumberExt}.map do |file|
     DIR=='build_script' ? file : "../UnitTest/#{file}"
  end
  OBJECTS= CLASSES + TEST_CLASSES + UNITTEST_CLASSES + ['test']
  $PASSED=nil
  task :default do
    puts `rake -T --silent`
  end

  task :all => [:arm, :mac] do
  end

  if defined? BUILD_ARM
    task :arm do end
  else
    desc "build with iPhoneOS#{IPHONE_SDK}.sdk"
    task :arm => :arm_link do
    end
  end

  desc "build with iPhoneSimulator#{IPHONE_SDK}.sdk"
  task :mac => :mac_link do
  end

  desc "run tests and display only results"
  task :p => :mac_compile do
    $PASSED=true
    builder = Builder.new :arch => :mac
    builder.link "#{APP}_mac_test", OBJECTS
    ENV['PASSED']="0"
    if dyld_fallback?
      puts `#{DIR}/#{APP}_mac_test.sh`
    else
      puts `#{DIR}/#{APP}_mac_test`
    end
  end

  desc "run tests"
  task :t => :mac_compile do
    builder = Builder.new :arch => :mac
    builder.link "#{APP}_mac_test", OBJECTS
    if dyld_fallback?
      wr = open("#{DIR}/#{APP}_mac_test.sh").read.gsub('PASSED=0','')
      open("#{DIR}/#{APP}_mac_test.sh", 'w') do |f| f.write wr end
      puts `#{DIR}/#{APP}_mac_test.sh`
    else
      puts `#{DIR}/#{APP}_mac_test`
    end
  end

  if defined? BUILD_ARM
    task :deploy do end
  else
    desc "deploy arm to #{DEPLOY}"
    task :deploy => :arm do
      cmd "cp #{DIR}/#{APP}_arm_test #{DEPLOY}"
    end
  end

  desc "clean up"
  task :clean do
    CLEANUP=nil if not defined? CLEANUP
    unittests = UNITTEST_CLASSES.map{|t|"#{t}*.o"}.join(' ')
    cmd "rm -f #{APP}_arm_test #{APP}_mac_test* #{unittests} #{CLEANUP} *.o"
  end
else
  dirs = Dir["*"].select{|dir| not IGNORE_FILES.include? dir }
  task :default do
    puts `rake -T --silent`
  end

  task :all do
    dirs.each do |dir|
      cmd "cd #{dir} && rake all"
    end
  end

  desc "build with iPhoneSimulator#{IPHONE_SDK}.sdk"
  task :mac do
    dirs.each do |dir|
      cmd "cd #{dir} && rake mac"
    end
  end

  desc "build with iPhoneOS#{IPHONE_SDK}.sdk"
  task :arm do
    dirs.each do |dir|
      cmd "cd #{dir} && rake arm"
    end
  end

  desc "run tests"
  task :t do
    dirs.each do |dir|
      puts `cd #{dir} && rake --silent t`
    end
  end

  desc "run tests and display only results"
  task :p do
    dirs.each do |dir|
      print "#{dir.ljust 15}"
      puts `cd #{dir} && rake --silent p`
    end
  end

  desc "deploy arm to #{DEPLOY}"
  task :deploy => :arm do
    dirs.each do |dir|
      cmd "cd #{dir} && rake deploy"
    end
	arm_tests = Dir['*/*arm_test'].map do |f|
      './' + f.split('/').last
    end
    open "#{DEPLOY}Makefile", 'w' do |f|
      f.write <<EOF
all:
	@echo "make t       # run tests"
	@echo "make p       # show only passed tests"

t:
#{arm_tests.map{|t| "\t@" + t}.join("\n")}

p:
#{arm_tests.map{|t| "\t@PASSED=0 " + t}.join("\n")}
EOF
    end
  end

  desc "clean up"
  task :clean do
    dirs.each do |dir|
      cmd "cd #{dir} && rake clean"
    end
  end
end

FRAMEWORKS=%w{Foundation} if not defined? FRAMEWORKS
FRAMEWORK=FRAMEWORKS.map{|f|" -framework #{f} "}.join ' '

ARM_CC="/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/gcc-4.2"
ARM_SYSROOT="/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS#{IPHONE_SDK}.sdk"
ARM_CFLAGS="-x objective-c -arch armv6 -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -fpascal-strings -fasm-blocks -Os -mdynamic-no-pic -Wreturn-type -Wunused-variable -isysroot #{ARM_SYSROOT} -fvisibility=hidden -gdwarf-2 -mthumb -miphoneos-version-min=#{IPHONE_SDK}"
ARM_LDFLAGS="-arch armv6 -isysroot #{ARM_SYSROOT} -mmacosx-version-min=10.5 -Wl,-dead_strip -miphoneos-version-min=#{IPHONE_SDK} #{FRAMEWORK}"
MAC_CC="/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin/gcc-4.0"
MAC_SYSROOT="/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator#{IPHONE_SDK}.sdk"
MAC_CFLAGS="-x objective-c -arch i386 -fmessage-length=0 -pipe -std=c99 -Wno-trigraphs -fpascal-strings -fasm-blocks -O0 -Wreturn-type -Wunused-variable -D__IPHONE_OS_VERSION_MIN_REQUIRED=20000 -isysroot #{MAC_SYSROOT} -fvisibility=hidden -mmacosx-version-min=10.5 -gdwarf-2"
MAC_LDFLAGS="-arch i386 -isysroot #{MAC_SYSROOT} -mmacosx-version-min=10.5 #{FRAMEWORK}"

def dyld_fallback?
  not FRAMEWORKS == %w{Foundation}
end

class Builder
  attr_reader :arch
  def initialize opt
    @arch = opt[:arch]
  end

  def arch_o obj
    case arch
    when :mac
      obj.mac.o
    when :arm
      obj.arm.o
    end
  end

  def compile objs=[] 
    objs.each do |obj|
      #puts "compile #{obj.m}"
      if should_compile? obj
        case arch
        when :mac
          cmd "#{MAC_CC} -c #{MAC_CFLAGS} #{obj.m} -o #{obj.mac.o}" 
        when :arm
          cmd "#{ARM_CC} -c #{ARM_CFLAGS} #{obj.m} -o #{obj.arm.o}" 
        end
      end
    end
  end

  def should_compile? obj
    if File.exist? arch_o(obj)
      src_time = File.mtime obj.m
      obj_time = File.mtime arch_o(obj)
      src_time > obj_time
    else
      true
    end
  end

  def link app, objs 
    objs_arch_o = objs.map{|obj|arch_o(obj)}.join ' '
    if should_link? app, objs
      case arch
      when :mac
        cmd "#{MAC_CC} #{MAC_LDFLAGS} -o #{app} #{objs_arch_o}"
        if dyld_fallback?
          ENV['DYLD_FALLBACK_FRAMEWORK_PATH']="#{MAC_SYSROOT}/System/Library/Frameworks"
          open "#{app}.sh", 'w' do |f|
            passed = "PASSED=0 " if $PASSED
            f.write <<EOF
#!/bin/sh
#{passed}DYLD_FALLBACK_FRAMEWORK_PATH="#{MAC_SYSROOT}/System/Library/Frameworks" #{DIR}/#{app}
EOF
          end
          cmd "chmod +x #{app}.sh"
        end
      when :arm
        cmd "#{ARM_CC} #{ARM_LDFLAGS} -o #{app} #{objs_arch_o}"
      end
    end
  end

  def should_link? bin, objs 
    if File.exist? bin 
      mtime = File.mtime bin 
      objs.any? { |obj| File.mtime(arch_o(obj)) > mtime }
    else
      true
    end
  end
end

class String
  def mac
    if self=~/\.c$/
      self.gsub('.c', '.mac')
    elsif self=~/\.m$/
      self.gsub('.m', '.mac')
    else
      self + '.mac'
    end
  end
  def arm
    if self=~/\.c$/
      self.gsub('.c', '.arm')
    elsif self=~/\.m$/
      self.gsub('.m', '.arm')
    else
      self + '.arm'
    end
  end
  def regularize
    gsub('["','').gsub('"]','')
  end
  def m
    file = self.regularize
    if file=~/\.c$/
      file
    elsif file=~/\.m$/
      file
    else
      file + '.m'
    end
  end
  def o
    self.regularize + '.o'
  end
end

task :arm_compile do
  builder = Builder.new :arch => :arm
  builder.compile OBJECTS
end

task :arm_link => :arm_compile do
  builder = Builder.new :arch => :arm
  builder.link "#{APP}_arm_test", OBJECTS
end

task :mac_compile do
  builder = Builder.new :arch => :mac
  builder.compile OBJECTS
end

task :mac_link => :mac_compile do
  builder = Builder.new :arch => :mac
  builder.link "#{APP}_mac_test", OBJECTS
end
