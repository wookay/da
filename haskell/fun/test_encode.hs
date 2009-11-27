-- test_encode
--                         wookay.noh at gmail.com

module Main where
import Prelude as P
import Codec.Text.IConv as I
import Data.ByteString.Lazy.Char8 as C (ByteString,pack,unpack)
import Codec.Binary.UTF8.String as CU
import System.IO.UTF8 as IU

assert_equal expected got =
  case expected==got of
    True -> IU.putStrLn $ "passed: " ++ expected;
    _ -> IU.putStrLn $ "Assertion failed\nExpected: " ++ expected
           ++ "\nGot: " ++ got

utf8_to_cp949 :: String -> ByteString
utf8_to_cp949 str = I.convert "UTF-8" "CP949" (C.pack $ CU.encodeString str)
cp949_to_utf8 :: ByteString -> String
cp949_to_utf8 = CU.decodeString . C.unpack . (I.convert "CP949" "UTF-8")

recover_cp949_encoding_iso8859_decode :: String -> String
recover_cp949_encoding_iso8859_decode = cp949_to_utf8 . C.pack

recover :: String -> String
recover str = 
  case P.length $ P.filter (\x -> '\170' < x && x < '\200') str of
    0 -> str;
    _ -> recover_cp949_encoding_iso8859_decode str

main = do
  assert_equal "하이" (cp949_to_utf8 $ utf8_to_cp949 "하이")
  assert_equal "안녕하세요~" (recover_cp949_encoding_iso8859_decode "¾È³çÇÏ¼¼¿ä~")
  assert_equal "하이" (recover "하이")
  assert_equal "안녕하세요~" (recover "¾È³çÇÏ¼¼¿ä~")
