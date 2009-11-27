-- test_bytestring
--                         wookay.noh at gmail.com

module Main where
import qualified Data.ByteString.Char8 as B
import Char

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

main = do
  assert_equal "abc" (map (\x -> x) "abc")

  assert_equal "abc" (map (\x -> x) "abc")
  assert_equal "bcd" (map (\x -> chr $ ord x + 1) "abc")

  assert_equal "abc" (B.unpack $ B.pack "abc")

  assert_equal "abc" (B.unpack $ B.pack "abc")
  assert_equal 'a' (B.head $ B.pack "abc")

  assert_equal "abc" (B.unpack $ (B.pack "abc"))
  assert_equal "bcd" (B.unpack $ (B.map (\x -> chr $ ord x + 1) $ B.pack "abc"))
