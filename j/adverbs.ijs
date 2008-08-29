NB.       J adverbs
NB.                       wookay.noh at gmail.com
NB.                       http://wookay.egloos.com

   reflexive =. passive =.   ~
   1 + 1 
2
   + reflexive 1
2
   3 - 1
2
   1 - passive 3
2

   evoke =.   ~
   sum =. +/
   ('su','m') evoke 1 2 3
6

   insert =. table =.   /
   1 + 2 + 3
6
   + insert 1 2 3
6
   2 3 * table 1 2 3 4 5 6 7 8 9
2 4 6  8 10 12 14 16 18
3 6 9 12 15 18 21 24 27

   oblique =. key =.   /.
   i. 2 3
0 1 2
3 4 5
   < oblique i. 2 3
+-+---+---+-+
|0|1 3|2 4|5|
+-+---+---+-+
   0 0 0 1 0 + key 1 2 3 4 5
1 2 3 5
4 0 0 0
   0 0 2 1 0 + key 1 2 3 4 5
1 2 5
3 0 0
4 0 0

   prefix =. infix =.   \
   < prefix 1 2 3 4 5
+-+---+-----+-------+---------+
|1|1 2|1 2 3|1 2 3 4|1 2 3 4 5|
+-+---+-----+-------+---------+
   2 < infix 1 2 3 4 5
+---+---+---+---+
|1 2|2 3|3 4|4 5|
+---+---+---+---+

   suffix =. outfix =.   \.
   < suffix 1 2 3 4 5
+---------+-------+-----+---+-+
|1 2 3 4 5|2 3 4 5|3 4 5|4 5|5|
+---------+-------+-----+---+-+
   2 < outfix 1 2 3 4 5
+-----+-----+-----+-----+
|3 4 5|1 4 5|1 2 5|1 2 3|
+-----+-----+-----+-----+

   item_amend =. amend =.   }
   i. 3 3
0 1 2
3 4 5
6 7 8
   2 1 0 item_amend i. 3 3
6 4 2
   3 4 $ 'ab'
abab
abab
abab
   'ffff' 0 amend 3 4 $ 'ab'
ffff
abab
abab
   'ffff' 0 1 amend 3 4 $ 'ab'
ffff
ffff
abab

   boolean =.   b.
   bitwise_and =. 17 b.
   bitwise_or =. 23 b.
   shift =. 33 b.
   #. 0 1 1 0
6
   #. 0 1 1 1
7
   #. 1 1 1 0
14
   7 bitwise_and 14
6
   6 bitwise_or 7
7
   1 shift 7
14

   basic =.   b.
   + basic 0
0 0 0
   +/ basic 0
_ _ _
   $ basic 0
_ 1 _
   i. basic 0
1 _ _

   fix =.   f.
   add =. +&2
   add_two =. add fix
   add =. +&3
   add 1 2 3
4 5 6
   add_two 1 2 3
3 4 5

   memo =.   M.
   fib=: 3 : 0 memo
      if. 1>:y do.
         y
      else.
         (fib y-1) + (fib y-2)
      end.
)
   fib 42
267914296

   taylor_coefficient =.   t.
   1 2 1 1 1 & p. taylor_coefficient 0 1 2 3 4
1 6 33 124 345
   1 2 1 1 1 & p. taylor_coefficient 0 1 2 3 4
1 2 1 1 1

   weighted_taylor =.   t:
   1 2 1 1 1 & p. weighted_taylor 0 1 2 3 4
1 2 2 6 24
