-- Fixnum
--                         wookay.noh at gmail.com

module Main where
import Test.QuickCheck

class Fixnum a where
  to_s :: a -> [Char]
  to_i :: a -> a
  next :: a -> a

instance Fixnum Int where
  to_s = show
  to_i = id
  next = succ


-- quickcheck
prop_to_s x = to_s x == show x
     where types = x::Int

prop_to_i x = to_i x == x
     where types = x::Int

prop_next x = next x == succ x
     where types = x::Int

main = do
  quickCheck prop_to_s
  quickCheck prop_to_i
  quickCheck prop_next
