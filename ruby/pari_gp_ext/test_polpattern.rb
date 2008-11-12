# test_polpattern
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.class==String ? expected : expected.inspect}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'pari_gp'

numbers = <<EOF
1  | uno            6  | seis 
2  | dos            7  | siete
3  | tres           8  | ocho
4  | cuatro         9  | nueve
5  | cinco          10 | diez
EOF

numero = polpattern %w{uno seis}, %w{1 6}
numero.feed numbers
assert_equal '4'     , numero.value(:key => 'cuatro')
assert_equal '10'    , numero.value(:key => 'diez')
assert_equal 'nueve' , numero.key(:value => '9')
assert_equal 'cinco' , numero.key(:value => '5')
assert_equal 'x - 5' , numero['x']

morse = polpattern 'hello world'.scan(/./), '....   .   .-..   .-..   ---       .--   ---   .-.   .-..   -..'.split('   ')
assert_equal 'h'     , morse.key(:value => '....')
