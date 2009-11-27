module MonadCowboy where

flop :: a -> (a -> b) -> b
flop x f = f x

newtype Wrapped a = Wrap a

wrflop :: Wrapped a -> (a -> Wrapped b) -> Wrapped b 
wrflop (Wrap x) f =  f x

divwrp :: Wrapped Double -> Wrapped Double -> Wrapped Double 
divwrp x y = x `wrflop`(\u -> y `wrflop` (\v -> (Wrap (u/v))))   

instance Show a => Show (Wrapped a) where 
         show (Wrap a) = "Wrapped: " ++ (show a)

instance Monad Wrapped where 
         (>>=) (Wrap x) f =  f x 
         return x = Wrap x

divwrp2 :: Wrapped Double -> Wrapped Double -> Wrapped Double 
divwrp2 x y = do
              u <- x 
              v <- y 
              return (u/v) 

-- newtype Wrapped a = Wrap {unwrap :: a}
