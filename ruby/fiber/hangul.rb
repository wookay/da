# encoding: utf-8
# hangul.rb
#                           wookay.noh at gmail.com

require 'fiber'

class Worker
  def initialize
    @text = ''
  end
  def feed pose, char
    case pose
    when :compose
      *pre, last = @text.split ''
      if last
        case pre
        when Array
          @text = pre.join.concat [last, char].johab
        when String
          @text.concat [last, char].johab
        else
          puts :eee
        end
      else
        @text.concat char 
      end
      @text
    when :depose
      separated = @text.separate
      separated.pop
      @text = separated.johab
    when :pop
      separated = @text.separate
      result = separated.pop
      @text = separated.johab
      result
    when :text
      @text
    end
  end
end

class Hangul < Fiber
  def initialize
    super do |pose, char|
      worker = Worker.new
      loop do
        result = worker.feed pose, char
        pose, char = Fiber.yield result
      end
    end
  end
  def compose char
    resume :compose, char
  end
  def depose
    resume :depose, nil
  end
  def pop
    resume :pop, nil
  end
  def text
    resume :text, nil
  end
end


CHOSUNG = %w{ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ}
JUNGSUNG = %w{ㅏ ㅐ ㅑ ㅒ ㅓ ㅔ ㅕ ㅖ ㅗ ㅘ ㅙ ㅚ ㅛ ㅜ ㅝ ㅞ ㅟ ㅠ ㅡ ㅢ ㅣ}
JONGSUNG = [nil] + %w{ㄱ ㄲ ㄳ ㄴ ㄵ ㄶ ㄷ ㄹ ㄺ ㄻ ㄼ ㄽ ㄾ ㄿ ㅀ ㅁ ㅂ ㅄ ㅅ ㅆ ㅇ ㅈ ㅊ ㅋ ㅌ ㅍ ㅎ}
JOSA = {'이' => '가', '은' => '는', '을' => '를', '과' => '와', '으로' => '로'}
CHOSUNG_OFFSET = 21 * 28
JUNGSUNG_OFFSET = 28
JONGSUNG_DIVIDE = 28

class String
  def separate jamotype=:all # chosung anti_chosung
    separated = []
    self.unpack('U*').each do |c|
      n = (c & 0xFFFF).to_i
      if n >= 0xAC00 && n <= 0xD7A3 # 가 힣
        n = n - 0xAC00
        n1 = n / (21 * 28)  # 초성
        n = n % (21 * 28)  # '가' ~ '깋'에서의 순서
        n2 = n / 28;    # 중성
        n3 = n % 28;    # 종성
        case jamotype
        when :all
          separated << CHOSUNG[n1] << JUNGSUNG[n2]
          separated << JONGSUNG[n3] if not 0==n3
        when :chosung
          separated << CHOSUNG[n1]
        when :anti_chosung
          separated << JUNGSUNG[n2]
          separated << JONGSUNG[n3] if not 0==n3
        end
      else
        case jamotype
        when :chosung
        else
          case c
          when Fixnum
            separated << [c].pack('U')
          else
            separated << c.to_a.pack('U')
          end
        end
      end
    end 
    separated
  end
  def combinable? jamotype, ch
    self.combine jamotype, ch
  end
  def combine jamotype, ch
    case jamotype
    when :chosung_chosung
      case [self, ch]
      when %w{ㄱ ㄱ}
        'ㄲ'
      when %w{ㄷ ㄷ}
        'ㄸ'
      when %w{ㅅ ㅅ}
        'ㅆ'
      when %w{ㅈ ㅈ}
        'ㅉ'
      end

    when :chosung_jungsung
      if CHOSUNG.include? self
        hana = nil
        chosung = self
      else
        *hana, dul = self.separate
        chosung = dul
      end
      char = 0xAC00 + CHOSUNG.index(chosung) * CHOSUNG_OFFSET + JUNGSUNG.index(ch) * JUNGSUNG_OFFSET
      chojung = [char].pack('U')
      case hana
      when nil
        chojung 
      when Array
        [hana.johab, chojung]
      end

    when :jungsung_jungsung
      if JUNGSUNG.include? self
        jungsung = self
      else
        jungsung = self.separate.last
      end
      case [jungsung, ch]
      when %w{ㅏ ㅣ}
        'ㅐ'
      when %w{ㅑ ㅣ}
        'ㅒ'     
      when %w{ㅓ ㅣ}
        'ㅔ'     
      when %w{ㅕ ㅣ}
        'ㅖ'     
      when %w{ㅗ ㅏ}
        'ㅘ'     
      when %w{ㅘ ㅣ}
        'ㅙ'     
      when %w{ㅗ ㅐ}
        'ㅙ'     
      when %w{ㅗ ㅣ}
        'ㅚ'     
      when %w{ㅜ ㅓ}
        'ㅝ'     
      when %w{ㅝ ㅣ}
        'ㅞ'     
      when %w{ㅜ ㅔ}
        'ㅞ'     
      when %w{ㅜ ㅣ}
        'ㅟ'     
      when %w{ㅡ ㅣ}
        'ㅢ'
      end

    when :jungsung_jongsung
      if JUNGSUNG.include? self
        [self, ch]
      else
        if JONGSUNG.include? ch
          char = 0xAC00 + JONGSUNG.index(ch) % JONGSUNG_DIVIDE
          self.separate.each do |c|
            if CHOSUNG.include? c
              char += CHOSUNG.index(c) * CHOSUNG_OFFSET
            elsif JUNGSUNG.include? c
              char += JUNGSUNG.index(c) * JUNGSUNG_OFFSET
            else #?
              puts :c
            end
          end
          [char].pack('U')
        end
      end

    when :jongsung_jungsung
      *separated, jongsung = self.separate
      if separated.empty?
        [jongsung, ch]
      else
        [separated.johab, [jongsung, ch].johab]
      end

    when :jongsung_jongsung
      char = 0xAC00
      if JONGSUNG.include? self
        jongsung = self
      else
        *separated, jongsung = self.separate
        separated.each do |c|
          if CHOSUNG.include? c
            char += CHOSUNG.index(c) * CHOSUNG_OFFSET
          elsif JUNGSUNG.include? c
            char += JUNGSUNG.index(c) * JUNGSUNG_OFFSET
          else #?
            puts :c
          end
        end
      end
      composed = case [jongsung, ch]
      when %w{ㄱ ㄱ}
        'ㄲ'
      when %w{ㄱ ㅅ}
        'ㄳ'
      when %w{ㄴ ㅈ}
        'ㄵ'
      when %w{ㄴ ㅎ}
        'ㄶ'
      when %w{ㄹ ㄱ}
        'ㄺ'
      when %w{ㄹ ㅁ}
        'ㄻ'
      when %w{ㄹ ㅂ}
        'ㄼ'
      when %w{ㄹ ㅅ}
        'ㄽ'
      when %w{ㄹ ㅌ}
        'ㄾ'
      when %w{ㄹ ㅍ}
        'ㄿ'
      when %w{ㄹ ㅎ}
        'ㅀ'
      when %w{ㅂ ㅅ}
        'ㅄ'
      when %w{ㅅ ㅅ}
        'ㅆ'
      else
        return nil
      end
      char += JONGSUNG.index(composed) % JONGSUNG_DIVIDE
      [char].pack('U')
    end 
  end
  def jamo
    c = self.separate.last
    return :chosung if CHOSUNG.include? c
    return :jungsung if JUNGSUNG.include? c
    return :jongsung if JONGSUNG.include? c
  end
  def chosung?
    CHOSUNG.include? self
  end
  def jungsung?
    JUNGSUNG.include? self
  end
  def jongsung?
    JONGSUNG.include? self
  end
end
class NilClass
  def jamo
  end
end

class Cycle
  attr_accessor :char
  attr_accessor :state
end
   
class Array
  def johab
    ary = []
    last = Cycle.new
    self.each do |current|
      case last.state
      when nil
        ary.push last.char
        last.char = current
        last.state = current.jamo

      when :chosung
        case current.jamo
        when nil
          ary.push last.char
          last.char = current
          last.state = nil
        when :chosung
          if last.char.combinable? :chosung_chosung, current
            last.char = last.char.combine :chosung_chosung, current
          else
            ary.push last.char
            last.char = current
          end
          last.state = :chosung
        when :jungsung
          comb = last.char.combine :chosung_jungsung, current
          case comb
          when Array
            hana, dul = comb
            ary.push hana
            last.char = dul
            last.state = :jungsung
          when String
            last.char = comb
            last.state = :jungsung
          end
        when :jonsung
          ary.push last.char
          last.char = current
          last.state = :jongsung
        end

      when :jungsung
        case current.jamo
        when nil
          ary.push last.char
          last.char = current
          last.state = nil
        when :chosung, :jongsung
          comb = last.char.combine :jungsung_jongsung, current
          case comb
          when nil
            last.char = current
            last.state = :jongsung
          when Array
            hana, dul = comb
            ary.push hana
            last.char = dul
            last.state = :chosung
          when String
            last.char = last.char.combine :jungsung_jongsung, current
            last.state = :jongsung
          else
            puts :c
          end
        when :jungsung
          if last.char.combinable? :jungsung_jungsung, current
            last.char = last.char.combine :jungsung_jungsung, current
          else
            ary.push last.char
            last.char = current
          end
          last.state = :jungsung
        end


      when :jongsung
        case current.jamo
        when nil
          ary.push last.char
          last.char = current
          last.state = nil
        when :jungsung
          comb = last.char.combine :jongsung_jungsung, current
          case comb
          when nil
            last.char = current
            last.state = :jungsung
          when Array
            hana, dul = comb
            ary.push hana
            last.char = dul
            last.state = :jungsung
          when String
            last.char = comb
            last.state = :jungsung
          else
            puts :c
          end
        when :chosung, :jongsung
          if last.char.combinable? :jongsung_jongsung, current
            last.char = last.char.combine :jongsung_jongsung, current
            last.state = :jongsung
          else
            ary.push last.char
            last.char = current
            last.state = :chosung
          end
        end
      end
    end

    ary.push last.char
    last.state = nil
    ary.join
  end 
end


__END__
def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

assert_equal %w{( ㅏ ㄱ )}, '(짝)'.separate(:anti_chosung)
assert_equal '한', %w{ㅎ ㅏ ㄴ}.johab
assert_equal '한그', %w{한ㄱ ㅡ}.johab
assert_equal 'ㅐ오개ㅣㅗ', %w{ㅐ ㅇ ㅗ ㄱ ㅐ ㅣ ㅗ}.johab
assert_equal 'ㅐ옥', %w{ㅐ ㅇ ㅗ ㄱ}.johab
assert_equal '한', %w{하 ㄴ}.johab
assert_equal '한그', %w{한ㄱ ㅡ}.johab
assert_equal '그', %w{ㄱ ㅡ}.johab
assert_equal '한그', %w{한 ㄱ ㅡ}.johab
assert_equal '한그', %w{ㅎ ㅏ ㄴ ㄱ ㅡ}.johab
assert_equal '한', %w{하 ㄴ}.johab
assert_equal %w{ㅎ ㅏ ㄴ}, '한'.separate
assert_equal '한', %w{ㅎ ㅏ ㄴ}.johab
assert_equal '한ㄱ', %w{ㅎ ㅏ ㄴ ㄱ}.johab
assert_equal %w{ㄱ ㅏ}, '가'.separate
assert_equal %w{ㄴ ㅓ}, '너'.separate
assert_equal %w{ㄴ ㅓ ㄴ}, '넌'.separate
assert_equal %w{a ㅏ ㄴ}, 'aㅏㄴ'.separate
assert_equal %w{ㅃ ㅞ ㄺ}, '쀍'.separate
assert_equal '가', %w{ㄱ ㅏ}.johab
assert_equal '나', %w{ㄴ ㅏ}.johab
assert_equal '너', %w{ㄴ ㅓ}.johab
assert_equal '까', %w{ㄱ ㄱ ㅏ}.johab
assert_equal '까', %w{ㄲ ㅏ}.johab
assert_equal '각', %w{ㄱ ㅏ ㄱ}.johab
assert_equal '간', %w{ㄱ ㅏ ㄴ}.johab
assert_equal '넌', %w{ㄴ ㅓ ㄴ}.johab
assert_equal '돈', %w{ㄷ ㅗ ㄴ}.johab
assert_equal 'ㅂㅅ', %w{ㅂ ㅅ}.johab
assert_equal 'a', %w{a}.johab
assert_equal 'abc', %w{a b c}.johab
assert_equal 'aㅏㄴ', %w{a ㅏ ㄴ}.johab
assert_equal '빵상', %w{ㅃ ㅏ ㅇ 상}.johab
assert_equal '쀍', %w{ㅃ ㅞ ㄺ}.johab
assert_equal '쀍', %w{ㅃ ㅞ ㄹ ㄱ}.johab
