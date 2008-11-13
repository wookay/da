# test_polinterpolate
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.class==String ? expected[0,75].strip : expected.inspect}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'pari_gp'

assert_equal <<EOF, plot("x=0, Pi, sin(x), 0, 1")

        1 |'''''''''''''''''''''''''__xx""""xx__'''''''''''''''''''''''''|
          |                       x"            "x                       |
          |                     x"                "x                     |
          |                   x"                    "x                   |
          |                 _"                        "_                 |
          |                x                            x                |
          |               "                              "               |
          |             _"                                "_             |
          |            _                                    _            |
          |           x                                      x           |
          |          x                                        x          |
          |         x                                          x         |
          |        x                                            x        |
          |       x                                              x       |
          |      x                                                x      |
          |     x                                                  x     |
          |    x                                                    x    |
          |   x                                                      x   |
          |  x                                                        x  |
          | _                                                          _ |
          |_                                                            _|
        0 _,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,_
          0                                                       3.141593
EOF

assert_equal <<EOF, plot(0, Math::PI, Math.method(:sin), 0, 1)

        1 |'''''''''''''''''''''''''''___xxx__'''''''''''''''''''''''''''|
          |                       _xx"        ""x_                       |
          |                     _"                "x_                    |
          |                   x"                     x_                  |
          |                 _"                         x                 |
          |               _"                            "_               |
          |              _                                x              |
          |             x                                  "_            |
          |           _"                                     _           |
          |          _                                        _          |
          |         _                                          _         |
          |        x                                            x        |
          |       x                                              _       |
          |      x                                                _      |
          |     _                                                  _     |
          |    _                                                         |
          |   _                                                     "    |
          |                                                          "   |
          |  "                                                        x  |
          | "                                                          _ |
          |x                                                             |
        0 _,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
          0                                                       3.141593
EOF
