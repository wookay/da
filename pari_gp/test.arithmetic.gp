\\ Elementary Arithmetic Functions
\\                           wookay.noh at gmail.com

read(unittest)

assert_equal( 0.E-28           , 0                        )
assert_equal( 0                , 0.0                      )
assert_equal( 0                , 0.E-28                   )

assert_equal( [1, 0, 0, 0]     , binary(8)                )
assert_equal(  1               , bittest(8, 3)            )
assert_equal(     0            , bittest(8, 2)            )
assert_equal( 11               , ceil(10.1)               )
assert_equal( 10               , floor(10.7)              )
assert_equal( 0.141592         , frac(3.141592)           )
assert_equal( 10               , round(10.1)              )
assert_equal( 11               , round(10.7)              )
assert_equal( 3                , truncate(3.141592)       )
assert_equal( 6                , gcd(12, 18)              )
assert_equal( 36               , lcm(12, 18)              )
assert_equal( 3                , content([12, 18, 21])    )

\\ Primes and Factorization 
assert_equal( [3]              , addprimes(3)             )
assert_equal( 11               , prime(5)                 ) \\ the nth prime
assert_equal( [2, 3, 5, 7, 11] , primes(5)                )
assert_equal( 11               , nextprime(8)             )
assert_equal( [2, 1; 3, 2]     , factor(18)               )
assert_equal(  2^1 * 3^2       , 18                       )
assert_equal( 18               , factorback([2, 1; 3, 2]) )

\\ Divisors 
assert_equal( 1                , omega(3)                 )
assert_equal( 2                , omega(18)                )
assert_equal( 3                , omega(240)               )
assert_equal( 1                , bigomega(3)              )
assert_equal( 3                , bigomega(18)             )
assert_equal( 6                , bigomega(240)            )
assert_equal( 2                , numdiv(3)                )
assert_equal( 4                , numdiv(6)                )
assert_equal( [1, 2, 3, 6]     , divisors(6)              )
assert_equal( 12               , sigma(6)                 )

\\ Special Functions and Numbers  
assert_equal( 9                     , binomial(9, 1)      )
assert_equal( 36                    , binomial(9, 2)      )
assert_equal( 84                    , binomial(9, 3)      )
assert_equal( 0                     , bernreal(3)         )
assert_equal( [1, 1/6, -1/30, 1/42] , bernvec(3)          )
assert_equal( 55                    , fibonacci(10)       )
assert_equal( 42                    , numbpart(10)        )
assert_equal( 12                    , eulerphi(42)        )
assert_equal( -1                    , moebius(42)         )
assert_equal( 1                     , hilbert(9, 3)       )
assert_equal( 0                     , kronecker(9, 3)     )

\\ Miscellaneous 
assert_equal( 120                       , factorial(5)         ) 
assert_equal( 120                       , 5!                   ) 
assert_equal( 5                         , sqrtint(25)          ) 
assert_equal( 1                         , chinese(1, 1)        ) 
assert_equal( [9, -1, 1]                , bezout(3, 26)        ) 
assert_equal( Mod(23, 42)               , znprimroot(42)       ) 
assert_equal( [12, [12], [Mod(15, 26)]] , znstar(26)           ) 
assert_equal( [3, 7, 7]                 , contfrac(3.14)       )
assert_equal( [3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2, 1, 84, 2, 1, 1, 15] , contfrac(Pi) )
assert_equal( [7, 2; 3, 1]              , contfracpnqn([2, 3]) )
assert_equal( 22/7                      , bestappr(Pi, 105)    )
assert_equal( 333/106                   , bestappr(Pi, 106)    )

quit
