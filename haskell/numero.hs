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
  fromInteger _ = Zero

assert_equals expected got = putStrLn $ show (expected == got)

main = do
  assert_equals Six (One + Two + Three)
  assert_equals Six (One * Two * Three)
  assert_equals True (One + Two == Three)
  assert_equals True (One < Two)
