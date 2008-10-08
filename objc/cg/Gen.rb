# Gen.rb
#                           wookay.noh at gmail.com

def funcs_from_header header
  open(header).read.split('CG_EXTERN ').each do |cgextern|
    f = cgextern.gsub("\n",'').gsub("    ",' ')
    f[0..f.index(')')].scan /(.*) (.*)\((.*)\)/ do |ret, func, argstr|
      args = argstr.split ','
      
      next if func.size == 0
      q = ret == 'bool' ? '?' : ''
      puts "#{func}#{q} #{args.map{|arg|arg.split(' ').last}.join(' ')}"
    end
  end
end

COREGRAPHICS = "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/"
funcs_from_header "#{COREGRAPHICS}/CGContext.h"
funcs_from_header "#{COREGRAPHICS}/CGPath.h"
