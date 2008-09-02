-- Numero
--                         wookay.noh at gmail.com

module Main where

data Numero = Zero | One | Two | Three | Four | 
              Five | Six | Seven | Eight | Nine | Ten
  deriving (Show, Enum)

instance Eq Numero where
  (==) x y = fromEnum x == fromEnum y

instance Ord Numero where
  (>) x y = fromEnum x > fromEnum y
  (<) x y = fromEnum x < fromEnum y
  (<=) x y = fromEnum x <= fromEnum y
  (>=) x y = fromEnum x >= fromEnum y

instance Num Numero where
  (+) x y = toEnum(fromEnum x + fromEnum y)
  (*) x y = toEnum(fromEnum x * fromEnum y)
  abs = id
  signum = id
  fromInteger = toEnum . fromEnum 

assert_equal expected got =
  case expected == got of
    True -> putStrLn $ "passed: " ++ show expected;
    _ -> putStrLn $ "Assertion failed\nExpected: " ++ show expected
           ++ "\nGot: " ++ show got

main = do
  assert_equal Six (One + Two + Three)
  assert_equal Six (One * Two * Three)
  assert_equal True (One + Two == Three)
  assert_equal True (One < Two)
  assert_equal 3 (One + Two)
  assert_equal Six (1 + 2 + 3)
  assert_equal Six (1 + 2 + Three)
