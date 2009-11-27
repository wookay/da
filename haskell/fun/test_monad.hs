-- test_monad
--                         wookay.noh at gmail.com

module Main where

newtype TypeA a = MakeTypeA a

instance Eq a => Eq (TypeA a) where
         (==) (MakeTypeA a) (MakeTypeA b) = a==b

instance Show a => Show (TypeA a) where
         show (MakeTypeA a) = "TypeA " ++ show a

instance Monad TypeA where 
         (>>=) (MakeTypeA x) f =  f x 
         return x = MakeTypeA x


assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got


main = do
  assert_equal (MakeTypeA 1) (MakeTypeA 1)
  assert_equal (MakeTypeA 3) (MakeTypeA $ (+) 1 2)
