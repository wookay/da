#!/usr/bin/ruby
# shell_google_translate.rb
#                           wookay.noh at gmail.com

require 'google_translate'
require 'ui_shell'

def prompt mode
  trans = GoogleTranslate.new('translate', mode).translate rescue nil
 "#{trans}> "
end

MODE = 'ko'
shell = Shell.new :mode => MODE, :prompt => prompt(MODE)
shell.delegate do |env, text|
  case text
  when /^@/
    case text
    when pat = /^@(\w+)/
      env[:mode] = pat.match(text)[1]
    else '@'
      env[:mode] = env[:mode]=='ko' ? 'en' : 'ko'
    end
    env[:prompt] = prompt(env[:mode])
  when '', nil
  else
    trans = GoogleTranslate.new(text, env[:mode]).translate rescue nil
    puts trans
  end
end

shell.start if __FILE__ == $0
