NB.       J verbs
NB.                       wookay.noh at gmail.com
NB.                       http://wookay.egloos.com

   self_classify =. equal =.   =
   self_classify 'apple'
1 0 0 0 0
0 1 1 0 0
0 0 0 1 0
0 0 0 0 1
   1 2 3 equal 1 3 5
1 0 0

   box =. less_than =.   <
   box 'apple'
+-----+
|apple|
+-----+
   1 2 3 less_than 1 3 5
0 1 1

   floor =. min =.   <.
   floor 3.6
3
   2 min 1
1

   decrement =. less_than_or_equal =.   <:
   decrement 1 2 3
0 1 2
   1 2 3 less_than_or_equal 1 3 5
1 1 1

   open =. larger_than =.   >
   1 2 ; 3 4
+---+---+
|1 2|3 4|
+---+---+
   open 1 2 ; 3 4
1 2
3 4
   1 3 5 larger_than 1 2 3
0 1 1

   ceiling =. max =.   >.
   ceiling 3.3
4
   1 max 3
3

   increment =. larger_or_equal =.   >:
   increment 1 2 3
2 3 4
   1 3 5 larger_or_equal 1 2 3
1 1 1

   infinity =.   _:
   infinity 1 2 3
_
   1 2 3 infinity 1 2 3
_

   conjugate =. plus =.   +
   conjugate 1j2
1j_2
   1 2 3 plus 1 3 5
2 5 8

   real_imaginary =. greatest_common_divisor =.   +.
   real_imaginary 1j2
1 2
   6 greatest_common_divisor 4
2

   double =. not_or =.   +:
   double 1 2 3
2 4 6
   0 0 1 not_or 0 1 1
1 0 0

   signum =. times =.   *
   signum _2.3 0 0.1 2
_1 0 1 1
   2 times 5
10

   length_angle =. least_common_multiple =.   *.
   length_angle 3j4 4j3
5 0.927295
5 0.643501
   6 least_common_multiple 4
12

   square =. not_and =.   *:
   square 2 3
4 9
   0 0 1 not_and 0 1 1
1 1 0

   negate =. minus =.   -
   negate _2 3
2 _3
   3 2 minus 1 1
2 1

   not =. less =.   -.
   not 1
0
   not 0
1
   not 2 1 0 _1 _2
_1 0 1 2 3
   1 3 5 7 less 1 2 3
5 7

   halve =. match =.   -:
   halve 1 2 3
0.5 1 1.5
   1 2 3 match 1 3 5
0

   reciprocal =. divided_by =.   %
   reciprocal 1 2 3 4 5
1 0.5 0.333333 0.25 0.2
   1 divided_by 1 2 3 4 5
1 0.5 0.333333 0.25 0.2

   matrix_inverse =. matrix_divide =.   %
   matrix_inverse 2 2 $ 1 2 3 4 5
       1  0.5
0.333333 0.25
   1 2 matrix_divide 2 2 $ 1 2 3 4 5
       1 0.5
0.666667 0.5

   square_root =. root =.   %:
   square_root 1 4 9 16
1 2 3 4
   2 root 1 4 9 16
1 2 3 4

   exponential =. power =.   ^
   exponential 0 1 2
1 2.71828 7.38906
   2 power 3 4 5
8 16 32

   natural_log =. logarithm =.   ^.
   natural_log 0 1 2
__ 0 0.693147
   2 logarithm 1 2 4 8 16
0 1 2 3 4

   shape_of =. shape =.   $
   0 1; 0 1; 0 1
+---+---+---+
|0 1|0 1|0 1|
+---+---+---+
   shape_of 0 1; 0 1; 0 1
3
   > 0 1; 0 1; 0 1
0 1
0 1
0 1
   shape_of > 0 1; 0 1; 0 1
3 2
   3 2 shape 0 1 2
0 1
2 0
1 2

   sparse =.   $.
   > 0 0 3; 0 2 0
0 0 3
0 2 0
   sparse > 0 0 3; 0 2 0
0 2 | 3
1 1 | 2
   1 2 3 $ 0 5
0 5 0
5 0 5
   sparse 1 2 3 $ 0 5
0 0 1 | 5
0 1 0 | 5
0 1 2 | 5
   0 sparse 1 2 3 $ 0 5
0 0 1 | 5
0 1 0 | 5
0 1 2 | 5

   self_reference =.   $:
   f =. $:&2 : *
   f 1 2 3
2 4 6

   nub =.   ~.
   nub 1 3 2 1 
1 3 2

   nub_sieve =. not_equal =.   ~:
   nub_sieve 1 3 2 1 3 2
1 1 1 0 0 0
   1 2 3 not_equal 1 3 5
0 1 1
   
   magnitude =. residue =.   |
   magnitude 1 _2 3j4
1 2 5
   3 residue 1 2 3 4 5 6 7
1 2 0 1 2 0 1

   reverse =. rotate =.   |.
   reverse 1 2 3
3 2 1
   1 rotate 1 2 3
2 3 1

   transpose =.   |:
   2 3 $ i.10
0 1 2
3 4 5
   transpose 2 3 $ i.10
0 3
1 4
2 5
   1 0 transpose 2 3 $ i.10
0 3
1 4
2 5

   ravel =. append =.   ,
   2 3 $ 0 1
0 1 0
1 0 1
   ravel 2 3 $ 0 1
0 1 0 1 0 1
   5 6 append 7 8
5 6 7 8

   ravel_items =. stitch =.   ,. 
   ravel_items 1 2 3
1
2
3
   0 stitch 5 6 7 8
0 5
0 6
0 7
0 8
   0 1 2 3 stitch 5 6 7 8
0 5
1 6
2 7
3 8

   itemize =. laminate =.   ,:
   $ i.5
5
   $ itemize i.5
1 5
   0 laminate i.5
0 0 0 0 0
0 1 2 3 4
   1 2 3 laminate 4 5 6
1 2 3
4 5 6

   raze =. link =.   ;
   2 3 $ i.10
0 1 2
3 4 5
   raze 2 3 $ i.10
0 1 2 3 4 5
   0 1 link 2 3
+---+---+
|0 1|2 3|
+---+---+

   words =. sequential_machine =.   ;:
   words 'J programming language'
+-+-----------+--------+
|J|programming|language|
+-+-----------+--------+
   |. sequential_machine 'J programming language'
+--------+-----------+-+
|language|programming|J|
+--------+-----------+-+
   |.&. sequential_machine 'J programming language'
language programming J

   tally =. copy =.   #
   tally 1 2 3
3
   1 0 1 copy 'abc'
ac
   1 2 3 copy 1 2 3
1 2 2 3 3 3

   base_two =. base =.   #.
   base_two 1 0 0 0
8
   10 base 1 2 3
123
   10 10 10 10 10 10 antibase 12345
0 1 2 3 4 5

   factorial =. out_of_combinations =.   !
   factorial 3
6
   factorial 5
120
   (factorial 5) % (factorial 3) * (factorial 5 - 3)
10
   3 out_of_combinations 5
10
   2 out_of_combinations - 10
55

   grade_up =. sort_up =.   /:
   grade_up 1 3 3 2 2
0 3 4 1 2
   'abcde' sort_up 1 3 3 2 2
adebc

   grade_down =. sort_down =.   \:
   grade_down 1 2 3
2 1 0
   grade_down 3 2 1
0 1 2
   'abcde' sort_down 1 1 2 2 2
cdeab
   'abcde' sort_down 1 1 1 2 2
deabc

   same =. left =.   [
   same 1 2 3
1 2 3
   1 2 3 left 4 5 6
1 2 3

   same =. right =.   ]
   same 1 2 3
1 2 3
   1 2 3 right 4 5 6
4 5 6

   catalogue =. from =.   {
   1 2 3 ; 4 5 6
+-----+-----+
|1 2 3|4 5 6|
+-----+-----+
   catalogue 1 2 3 ; 4 5 6
+---+---+---+
|1 4|1 5|1 6|
+---+---+---+
|2 4|2 5|2 6|
+---+---+---+
|3 4|3 5|3 6|
+---+---+---+
   0 1 2 _2 _1 from 'abcde'
abcde

   head =. take =.   {.
   head 1 2 ; 3 4 ; 5 6
+---+
|1 2|
+---+
   2 take 1 2 ; 3 4 ; 5 6
+---+---+
|1 2|3 4|
+---+---+
   3 take 3
3 0 0
   _3 take 3
0 0 3

   tail =.   {:
   tail 1 2 ; 3 4 ; 5 6
+---+
|5 6|
+---+

   map =. fetch =.   {::
   2 ; 3 ; (4 ; 5) ; 6
+-+-+-----+-+
|2|3|+-+-+|6|
| | ||4|5|| |
| | |+-+-+| |
+-+-+-----+-+
   map 2 ; 3 ; (4 ; 5) ; 6
+---+---+-------------+---+
|+-+|+-+|+-----+-----+|+-+|
||0|||1|||+-+-+|+-+-+|||3||
|+-+|+-+|||2|0|||2|1|||+-+|
|   |   ||+-+-+|+-+-+||   |
|   |   |+-----+-----+|   |
+---+---+-------------+---+
   2 3 4 $ i.24
 0  1  2  3
 4  5  6  7
 8  9 10 11

12 13 14 15
16 17 18 19
20 21 22 23
   (> 0 2 3; 1 2 3) fetch 2 3 4 $ i.24
11 23

   behead =. drop =.   }.
   behead 1 2 ; 3 4 ; 5 6
+---+---+
|3 4|5 6|
+---+---+
   1 drop 1 2 ; 3 4 ; 5 6
+---+---+
|3 4|5 6|
+---+---+

   curtail =.   }:
   curtail 1 2 ; 3 4 ; 5 6
+---+---+
|1 2|3 4|
+---+---+

   do =. numbers =.   ".
   do '1+2'
3
   0 numbers '1 2 3 A 10'
1 2 3 0 10

   default_format =. format =.   ":
   i. 3 4
0 1  2  3
4 5  6  7
8 9 10 11
   |: i. 3 4
0 4  8
1 5  9
2 6 10
3 7 11
   |: default_format i. 3 4
048
   
159
   
  1
260
   
  1
371
   1 format i. 3 4
0123
4567
89**
   5 format i. 3 4
    0    1    2    3
    4    5    6    7
    8    9   10   11

   roll =. deal =.   ?
   roll 5
0
   roll 5
3
   5 deal 5
3 0 2 4 1
   5 deal 5
1 3 0 2 4

   fixed_seed_roll =. fixed_seed_deal =.   ?.
   fixed_seed_roll 5
1
   fixed_seed_roll 5
1
   5 fixed_seed_deal 5
1 4 0 3 2
   5 fixed_seed_deal 5
1 4 0 3 2

   anagram_index =. anagram =.   A.
   |. i. 6
5 4 3 2 1 0
   A. |. i. 6
719
   (! 6) - 1
719
   (i. 6) anagram 'abc'
abc
acb
bac
bca
cab
cba

   cycle =. permute =.   C.
   i. 2 3
0 1 2
3 4 5
   cycle i. 2 3
+-+-+-+-+-+-+
|0|1|2| | | |
+-+-+-+-+-+-+
|0|1|2|3|4|5|
+-+-+-+-+-+-+
   1 2 permute '0ab34'
034ab

   raze_in =. member_in =.   e.
   raze_in 'apple'
1 0 0 0 0
0 1 1 0 0
0 1 1 0 0
0 0 0 1 0
0 0 0 0 1
   'apple' member_in 'p'
0 1 1 0 0

   member_of_interval =.   E.
   1 2 3 member_of_interval 1 2 3 1 2 3 0 1 2 3
1 0 0 1 0 0 0 1 0 0

   integers =. index_of =.   i.
   integers 3
0 1 2
   integers 2 3
0 1 2
3 4 5
   'abcdefghijklmnopqrstuvwxyz' index_of 'apple'
0 15 15 11 4

   steps =. index_of_last =.   i:
   steps 3
_3 _2 _1 0 1 2 3
   1 2 3 1 2 3 0 1 2 3 index_of_last 1 2 3
7 8 9

   indices =. interval_index =.   I.
   indices 0 1 2 3 4 5
1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
   2 interval_index 2 2 2 3 3 3 3 3 3 3
0 0 0 1 1 1 1 1 1 1
   2 interval_index i. 10
0 0 0 1 1 1 1 1 1 1

   imaginary =. complex =.   j.
   imaginary 5
0j5
   3 complex 5
3j5

   level_of =.   L.
   <<<1
+-----+
|+---+|
||+-+||
|||1|||
||+-+||
|+---+|
+-----+
   level_of <<<1

   pi_times =. circle_function =.   o.
   pi_times 1
3.14159
   1 circle_function 2
0.909297
   sin =. 1 & circle_function
   sin 2
0.909297
 
   roots =. polynomial =.   p.
   roots 1 0 0 1
+-+-----------------------------+
|1|0.5j0.866025 0.5j_0.866025 _1|
+-+-----------------------------+
   0 5 10 polynomial 0 1 2 3 4 5
0 15 50 105 180 275

   polynomial_derivative =. polynomial_integral =.   p..
   polynomial_derivative 0 1 2 3 4 5
1 4 9 16 25
   0 polynomial_derivative 1 4 9 16 25
0 1 2 3 4 5

   primes =.   p:
   primes i.10
2 3 5 7 11 13 17 19 23 29
   1 primes 2 3 5 7 9
1 1 1 1 0 

   prime_factors =. prime_exponents =.   q:
   prime_factors 42
2 3 7
   5 prime_exponents 42
1 1 0 1 0

   angle =. polar =.   r.
   ^0j2
_0.416147j0.909297
   angle 2
_0.416147j0.909297
   | angle 2
1
   2 * angle 2
_0.832294j1.81859
   2 polar 2
_0.832294j1.81859

   symbol =.   s:
   symbol '`symbol'
`symbol

   unicode =.   u:
   unicode 65 97
Aa
   3 unicode 'Aa'
65 97

   extended_precision =. num_denom =.   x:
   extended_precision 1.2
6r5
   2 num_denom 1.2 6r5
6 5
6 5

   constant_functions =.   _9:_8:_7:_6:_5:_4:_3:_2:_1:0:1:2:3:4:5:6:7:8:9:
   3: 123456789
3
   123456789 3: 123456789
3
