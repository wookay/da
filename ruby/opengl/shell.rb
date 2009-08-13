#!/usr/bin/ruby
# shell.rb

PROMPT = "opengl> "

%w{readline ui_opengl}.each { |file| require file }
include Readline

class Shell
  include UIOpenGL

  def initialize
    @_ = nil
    %w{history help debug quit @nodes}.each do |action|
      HISTORY.push action
    end
    Readline.completion_proc = proc do |input|
      HISTORY.select { |history| history.match /^#{input}/ }
    end
  end
  def input_action input
      case input
      when /^!(\d*)/
        idx = input.match(/^!(\d*)/)[1].to_i
        action = HISTORY[idx]
        puts "#{PROMPT}#{action}"
        input_action action
      when 'y', 'history'
        HISTORY.each_with_index do |history,idx|
          puts "#{idx} #{history}"
        end
      when '_'
        puts @_
      when 'help'
        puts <<EOF
OpenGL Shell:
  help quit history !# _
EOF
      else
        HISTORY.push input
        begin
          _ = @_
          result = self.instance_eval input
          @_ = result
          puts result
        rescue ArgumentError => e
          puts e
        rescue NameError
          result = input
          @_ = result
          puts result
        rescue SyntaxError
          puts input
        end
      end
  end
  def start
    start_opengl
    at_exit do
      stop_opengl
      puts "exit"
    end
    while input = readline(PROMPT, false)
      case input.strip
      when 'q', 'quit'
        break
      else
        input_action input
      end
    end
  end
end

Shell.new.start if __FILE__ == $0
