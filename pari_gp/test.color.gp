\\ test.color.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

read(unittest)
read("fun.color") \\ rgb_to_hsv hsv_to_rgb

assert_equal( [0, 100, 100]   , rgb_to_hsv([255, 0, 0])     )
assert_equal( [120, 100, 100] , rgb_to_hsv([0, 255, 0])     )
assert_equal( [240, 100, 100] , rgb_to_hsv([0, 0, 255])     )
assert_equal( [300, 0, 0]     , rgb_to_hsv([0, 0, 0])       )
assert_equal( [300, 0, 100]   , rgb_to_hsv([255, 255, 255]) )

assert_equal( [255, 0, 0]     , hsv_to_rgb([0, 100, 100])   )
assert_equal( [0, 0, 0]       , hsv_to_rgb([0, 0, 0])       )
assert_equal( [0, 0, 0]       , hsv_to_rgb([100, 0, 0])     )
assert_equal( [0, 0, 0]       , hsv_to_rgb([0, 100, 0])     )
assert_equal( [255, 255, 255] , hsv_to_rgb([0, 0, 100])     )

quit
