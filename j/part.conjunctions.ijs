NB.       J conjunctions
NB.                       wookay.noh at gmail.com
NB.                       http://wookay.egloos.com

   power =.   ^:
   ---1
_1
   - power (3) 1
_1 
   u: 'ABC'
ABC
   u: power _1 'ABC'
65 66 67

   determinant =. dot_product =.   .
   +&0.1 determinant *&2 i. 3 3
 0.1  2.1  4.1
 6.1  8.1 10.1
12.1 14.1 16.1
   1 2 3 +&0.1 dot_product *&2 i. 2 3
 0.1  2.1  4.1
 6.1  8.1 10.1

 0.3  4.3  8.3
12.3 16.3 20.3

 0.7  8.7 16.7
24.7 32.7 40.7

   even =.   ..
   *&2 even (+&0.1) i.10
0.1 2.1 4.1 6.1 8.1 10.1 12.1 14.1 16.1 18.1

   odd =.   .:
   *&2 odd (-) i.10
0 2 4 6 8 10 12 14 16 18

   explicit_definition =.   :
   noun =. 0 explicit_definition 0
apple
)
   noun = 'apple', u: 10
1 1 1 1 1 1

   adverb =. 1 explicit_definition 0
x/ ; x
)
   + adverb 1 2 3
+-+-----+
|6|1 2 3|
+-+-----+

   conjunction =. 2 explicit_definition 0
:
4 2 $ 'x' ; x ; 'u x' ; (u x) ; 'y' ; y ; 'v y' ; (v y)
)
    1 2 3 (*&2) conjunction (+&1) i. 10
+---+--------------------+
|x  |1 2 3               |
+---+--------------------+
|u x|2 4 6               |
+---+--------------------+
|y  |0 1 2 3 4 5 6 7 8 9 |
+---+--------------------+
|v y|1 2 3 4 5 6 7 8 9 10|
+---+--------------------+

   verb =. 3 explicit_definition 0
y + 1
)
   verb i.10
1 2 3 4 5 6 7 8 9 10

   dyad_only_verb =. 4 explicit_definition 0
x + y
)
   1 2 3 dyad_only_verb 4 5 6
5 7 9

   monad_dyad =.   :
   f =. $:&2 monad_dyad *
   f 1 2 3
2 4 6

   obverse =.   :.
   *&2 obverse v 1 2 3
2 4 6

   adverse =.   ::
   *&2 adverse v 1 2 3
2 4 6
   (*&2) adverse < 'error'
+-----+
|error|
+-----+

   cut =.   ;.
   < cut _2 'split by space' , ' '
+-----+--+-----+
|split|by|space|
+-----+--+-----+
   , ;: cut _2 'split, by, comma' , ','
+-----+--+-----+
|split|by|comma|
+-----+--+-----+

   fit_customize =.   !.
   3 < fit_customize 0 (2 3 4 5 6 7)
0 0 1 1 1 1

   foreign =.   !:

   class_of =. 3 : 0
      idx =. 4 foreign 0 < y
      > idx { ;: 'Noun Adverb Conjunction Verb DyadOnlyVerb TacitVerb'
)
   number =. 123
   string =. 'abc' 
   table23 =. 2 3 $ 0
   box =. 1 ; 2 ; 3
   class_of 'string'
Noun
   class_of 'table23'
Noun
   class_of 'box'
Noun
   class_of 'box'
Noun
   plus =. +
   insert =. /
   atop =. @
   class_of 'plus'
Verb
   class_of 'insert'
Adverb
   class_of 'atop'
Conjunction

   show_nouns =. 4 foreign 1 (0)
   show_verbs =. 4 foreign 1 (3)
+--------+
|class_of|
+--------+

   rank =.   "
   i. 2 3 rank 0 (i. 2)
0 1 2
3 4 5

0 1 2
3 4 5

   tie =.   `
   '+' ; '*'
+-+-+
|+|*|
+-+-+
   + tie *
+-+-+
|+|*|
+-+-+
   1 + 2 * 3 + 4 * 5
47
   + tie * / 1 2 3 4 5
47

   evoke_gerund =.   `:
   >: ` [ ` <: evoke_gerund 0 i.5
 1 2 3 4 5
 0 1 2 3 4
_1 0 1 2 3

   atop =.   @
   *&2 +&0.1 i.5
0.2 2.2 4.2 6.2 8.2
   *&2 atop +&0.1 i.5
0.2 2.2 4.2 6.2 8.2
   1 2 3 *&2 atop +&0.1 i.5
0.2 2.2  4.2  6.2  8.2
0.6 4.6  8.6 12.6 16.6
1.4 9.4 17.4 25.4 33.4

   agenda =.   @.
   +:`-: agenda 0 i.5
0 2 4 6 8
   +:`-: agenda 1 i.5
0 0.5 1 1.5 2

   at =.   @:
   1 2 3 +/ atop +&1 i.5
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
   1 2 3 +/ at +&1 i.5
15 16 17

   bond =. compose =.   &
   1 + (2)
3
   + bond 1 (2)
3
   (+: 4) - (+: 3)
2
   4 - compose +: 3
2

   under =.   &.
   -: * +: 3
0.5
   * under +: 3
0.5
   -: (+: 2) * (+: 3)
12
   2 * under +: 3
12

   under_rank =.   &.:
   +/ under ^ 2 3 4
2 3 4
   +/ under_rank ^ 2 3 4
4.40761
   +/ under ^. 2 3 4
2 3 4
   +/ under_rank ^. 2 3 4
24

   appose =.   &:
   a =. 'abcde' ; '01234'
   b =. 'fghij' ; '56789'
   a , & > b
abcdefghij
0123456789
   a , appose > b
abcde
01234
fghij
56789

   derivative =.   d.
   ^. derivative 1
+-+
|%|
+-+
   % derivative _1
+--+
|^.|
+--+
   *: derivative 1
+--+
|+:|
+--+
   +: derivative _1
+--+
|*:|
+--+

   derivative =.   d.
   ^&2"0 nth_derivative 1
+--+-+-+
|+:|"|0|
+--+-+-+

   secant_slope =.   D:
   1 *: secant_slope 1 (0 1 2 3 4)
1 3 5 7 9
   2 *: secant_slope 1 (0 1 2 3 4)
2 4 6 8 10
   3 *: secant_slope 1 (0 1 2 3 4)
3 5 7 9 11
   1 * secant_slope 1 (0 1 2 3 4)
1 0 0 0 0
   2 * secant_slope 1 (0 1 2 3 4)
0.5 0 0 0 0
   3 * secant_slope 1 (0 1 2 3 4)
0.333333 0 0 0 0

   hypergeometric =.   H.
   ^ i. 6
1 2.71828 7.38906 20.0855 54.5982 148.413
   (1 hypergeometric 1) i. 6
1 2.71828 7.38906 20.0855 54.5982 148.413

   level_at =.   L:
   +: level_at 0 (2 3 ; < 4 ; < 5 ; 6)
+---+-----------+
|4 6|+-+-------+|
|   ||8|+--+--+||
|   || ||10|12|||
|   || |+--+--+||
|   |+-+-------+|
+---+-----------+

   spread =.   S:
   +: spread 0 (2 3 ; < 4 ; < 5 ; 6)
 4 6
 8 0
10 0
12 0

   taylor_approximation =.   T.
   1 ": ^ 0 0.2 0.4 0.6 0.8 1
111223
   1 ": ^ (taylor_approximation 8) 0 0.2 0.4 0.6 0.8 1
111223
   1 ": ^ (taylor_approximation 1) 0 0.2 0.4 0.6 0.8 1
111111
   1 ": ^ (taylor_approximation 2) 0 0.2 0.4 0.6 0.8 1
111222
   1 ": ^ (taylor_approximation 3) 0 0.2 0.4 0.6 0.8 1
111222
   1 ": ^ (taylor_approximation 4) 0 0.2 0.4 0.6 0.8 1
111223
   1 ": ^ (taylor_approximation 5) 0 0.2 0.4 0.6 0.8 1
111223
