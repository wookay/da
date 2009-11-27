-- test_word8
--                         wookay.noh at gmail.com

module Main where
import Data.Word
import Char

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

i2c :: Int -> Char
i2c = chr

c2i :: Char -> Int
c2i = ord

w2c :: Word8 -> Char
w2c = chr . fromIntegral

c2w :: Char -> Word8
c2w = fromIntegral . ord

main = do
  assert_equal ' ' (i2c 32)
  assert_equal 32 (c2i ' ')
  assert_equal ' ' (w2c 32)
  assert_equal ' ' (w2c (32 :: Word8))
  assert_equal " " (map w2c [32])
  assert_equal "  " (map w2c [32,32])
  assert_equal 32 (c2w ' ')
  assert_equal [32,32] (map c2w "  ")
