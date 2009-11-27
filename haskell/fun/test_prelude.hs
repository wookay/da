-- test_prelude
--                         wookay.noh at gmail.com

module Main where

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

main = do
  assert_equal '#' (toEnum 35)
  assert_equal '#' (toEnum 35::Char)
  assert_equal 35 (fromEnum '#')
  assert_equal [97,98,99] (map fromEnum "abc")
  assert_equal "abc" (map toEnum [97,98,99])
  assert_equal "abc" (map (toEnum . fromEnum) "abc")
  assert_equal "\44032\45208\45796" (map (toEnum . fromEnum) "가나다")
