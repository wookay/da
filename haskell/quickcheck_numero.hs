-- Type classes and instances in Haskell
--                                        wookay.noh at gmail.com

module Main where
import Test.QuickCheck

class Numero a where
  say :: a -> [Char]

instance Numero Int where
  say = show

prop_numero x = say x == show x
                where types = x::Int

main = do
  quickCheck prop_numero
