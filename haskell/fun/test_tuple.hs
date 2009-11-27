-- test_tuple
--                         wookay.noh at gmail.com

module Main where

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

tuple :: t1 -> t2 -> (t1, t2)
tuple a b = (a,b)

tuple2 :: (t1, t2) -> (t2, t1)
tuple2 (x,y) = (,) y x

tuple3 :: (t1, t2, t3) -> (t3, t2, t1)
tuple3 (x,y,z) = (,,) z y x

main = do
  assert_equal (1,1) ((,) 1 1)
  assert_equal (1,1,1) ((,,) 1 1 1)
  assert_equal (1,1) (tuple 1 1)
  assert_equal (2,1) (tuple2 (1,2))
  assert_equal (3,2,1) (tuple3 (1,2,3))
