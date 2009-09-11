# alien_language.rb
#                           wookay.noh at gmail.com

# L lowercase letters.
# D words in this language.
# A pattern consists of exactly L tokens
  # Each token is either 
  # a single lowercase letter (the scientists are very sure that this is the letter) or 
  # a group of unique lowercase letters surrounded by parenthesis ( and ).

# The first line of input contains 3 integers, L, D and N separated by a space. D lines follow, each containing one word of length L. These are the words that are known to exist in the alien language. N test cases then follow, each on its own line and each consisting of a pattern as described above. You may assume that all known words provided are unique.


def make_pattern pattern
  state = :close
  rule = ''
  last_ch = ''
  pattern.split('').each do |ch|
    case ch
    when '('
      state = :open
      rule << '('
    when ')'
      state = :close
      rule << ')'
    else
      case state
      when :open
        case last_ch
        when '('
        else
          rule << '|'
        end
        rule << ch
      when :close
        rule << "[#{ch}]"
      end
    end
    last_ch = ch
  end
  Regexp.new rule
end

def translate length, words, pattern
  pat = make_pattern pattern
  words.select do |word|
    word =~ pat
  end.size
end

def parse_rule
  lambda do |feed|
    l, d, n = feed.readline.split ' '
    words = d.to_i.times.map { feed.readline }
    [l, words, n.to_i]
  end
end

if __FILE__ == $0
  require 'jam'
  jam = Jam.new
  length, words, dataset_size = jam.parse parse_rule
  jam.feed 1, :dataset_size => dataset_size do |case_num, pattern|
    puts "Case ##{case_num}: #{translate(length, words, pattern)}"
  end
end
