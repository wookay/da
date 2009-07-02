" test.st
                             wookay.noh at gmail.com
"

|expected got|
expected := 3     .
got      := 1 + 2 .
(expected = got)
ifTrue:
  [Transcript
    show: 'passed: ';
    show: expected; cr
    .]
ifFalse:
  [Transcript
    show: 'Assertion failed'; cr;
    show: 'Expected: '; 
    show: expected; cr ;
    show: 'Got: '; 
    show: got; cr
    .]
