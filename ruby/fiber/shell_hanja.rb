#!/usr/bin/ruby
# shell_hanja.rb
#                           wookay.noh at gmail.com

require 'hanja'
require 'ui_shell'

shell = Shell.new :prompt => 'hanja> '
shell.delegate do |env, text|
  case text
  when ''
  else
    hanja = Hanja.new
    hanja.compose text
    puts hanja.to_hangul
  end
end

shell.start if __FILE__ == $0
