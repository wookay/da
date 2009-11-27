-- test_maybe
--                         wookay.noh at gmail.com

module Main where
import Maybe

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

maybeToInt :: Maybe a -> a
maybeToInt (Just x) = x

main = do
  assert_equal 1 (maybeToInt (Just 1))
  assert_equal True (isJust (Just 1))
  assert_equal False (isJust Nothing)
  assert_equal True (isNothing Nothing)
  assert_equal 2 (fromMaybe 2 Nothing)
  assert_equal 3 (fromJust (Just 3))
  assert_equal [3] (maybeToList (Just 3))
  assert_equal "" (maybeToList Nothing)
  assert_equal Nothing (listToMaybe "")
  assert_equal (Just 3) (listToMaybe [3])
