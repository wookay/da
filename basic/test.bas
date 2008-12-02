REM test.bas
REM                           wookay.noh at gmail.com

 10 F = 100
 20 S = 200
 30 T = 400
 40 GOTO T

REM Function
100 Y = 140
110 N = 160
120 IF A=B THEN GOTO Y
130 GOTO N
REM YES
140   PRINT "passed: " ; A
150   RETURN
REM NO
160   PRINT "Assertion failed"
170   PRINT "Expected: " ; A
180   PRINT "Got: " ; B
190   RETURN

REM function for String
200 Y = 240
210 N = 260
220 IF A$=B$ THEN GOTO Y
230 GOTO N
REM YES
240   PRINT "passed: " ; A$
250   RETURN
REM NO
260   PRINT "Assertion failed"
270   PRINT "Expected: " ; A$
280   PRINT "Got: " ; B$
290   RETURN

REM Tests
400 A = 1
410 B = 1
420 GOSUB F
430 A = 3
440 B = 1+2
450 GOSUB F
460 A = 7
470 B = 1+2*3
480 GOSUB F
490 A = 1
500 B = 1=1
510 GOSUB F
520 A$ = "a"
530 B$ = "a"
560 GOSUB S
600 END
