require 'readline'
require 'timeout'
include Readline

PROMPT = '> '
HISTORY.push 'quit'
Readline.completion_proc = proc do |input|
  HISTORY.select do |history|
    history[0..input.size-1].strip == input.strip
  end
end

begin
  Timeout::timeout 0.1 do

    while input = readline(PROMPT, false)
      case input
      when 'quit'
        break
      end
    end
  end

rescue Timeout::Error
end
