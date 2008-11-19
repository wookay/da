" test.st
                             wookay.noh at gmail.com
                             http://wookay.egloos.com
"

Object extend [
  assert:expected equals:got [
    expected=got
      ifTrue: [
        'passed: ' display,
        expected displayNl
      ]
      ifFalse: [
        'Assertion failed' displayNl,
        'Expected: ' display,
        expected displayNl,
        'Got: ' display,
        got displayNl
      ]
  ]
]

Smalltalk assert:1    equals:1    .
Smalltalk assert:3    equals:1+2  .
Smalltalk assert:'a'  equals:'a'  .
Smalltalk assert:true equals:1==1 .
