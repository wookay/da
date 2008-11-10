-- test
--                         wookay.noh at gmail.com

module Main where

assert_equal expected got =
  case expected==got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

main = do
  assert_equal 1   1
  assert_equal 3   (1+2)
  assert_equal "a" ['a']
