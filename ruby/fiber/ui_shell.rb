# shell.rb
#                           wookay.noh at gmail.com

require 'readline'
include Readline

class Shell
  def initialize options
    @options = options
    %w{quit}.each do |action|
      HISTORY.push action
    end
    Readline.completion_proc = proc do |input|
      HISTORY.select { |history| history.match /^#{input}/ }
    end
  end
  def delegate &block
    @delegate = block
  end
  def start
    at_exit do
      puts "exit"
    end
    while input = readline(@options[:prompt], false)
      case input.strip
      when 'q', 'quit'
        break
      else
        HISTORY.push input
        @delegate.call @options, input
      end
    end
  end
end
