-- test_regex
--                         wookay.noh at gmail.com

module Main where
import Maybe

import qualified Text.Regex as R

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

findTiny text = do
  [kind] <- R.matchRegex begreg text
  return $ kind
  where begreg = R.mkRegexWithOpts "<title>(.*)</title>" False False

main = do
  assert_equal (Just "def") (findTiny "abc<title>def</title>ghi")
