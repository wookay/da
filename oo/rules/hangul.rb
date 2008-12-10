class String
  # 한글 초성, 중성, 종성 (UTF-8 이어야 함)
  @@chosung = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ']
  @@jungsung = ['ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ']
  @@jongsung = ['', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', '>ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ']
  # UTF-8 형식의 문자열을 분해한다.
  def chosungs
    separate true, false, false
  end
  def jungsungs
    separate false, true, false
  end
  def jongsungs
    separate false, false, true
  end
  def separate cho=true, jung=true, jong=true
    separated = []
    self.unpack('U*').each do |c|
      n = (c & 0xFFFF).to_i
      # 유니코드 2.0 한글의 범위: AC00(가) ~ D7A3(힣)
      if n>=0xAC00 && n<=0xD7A3
        n = n - 0xAC00
        n1 = n / (21*28) # 초성: '가'~'깋' -> 'ㄱ'
        n = n % (21*28) # '가' ~ '깋'에서의 순서
        n2 = n / 28 # 중성
        n3 = n % 28 # 종성
        separated << @@chosung[n1] if cho
        separated << @@jungsung[n2] if jung
        separated << @@jongsung[n3] if jong
      else
        separated << Array(c).pack('U')
      end
    end
    separated.join''
  end
end

require "#{File.dirname __FILE__}/pol"
pol = Pol.new
pol.monad = %w{chosungs jungsungs jongsungs}
pol.call ARGV
