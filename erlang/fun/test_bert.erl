-module(test_bert).
-author('wookay.noh@gmail.com').
-export([main/0]).

assert_equal(Expected, Got) ->
  case Expected==Got of
  true ->
    io:format("passed: ~w~n", [Expected]);
  _ ->
    io:format("Assertion failed\nExpected: ~w\nGot: ~w~n", [Expected, Got])
  end.

main() ->
  SMALL_INT = 97, INT = 98, SMALL_BIGNUM = 110, LARGE_BIGNUM = 111,
  FLOAT = 99, ATOM = 100, REF = 101, NEW_REF = 114, PORT = 102,
  PID = 103, SMALL_TUPLE = 104, LARGE_TUPLE = 105, NIL = 106,
  STRING = 107, LIST = 108, BIN = 109, FUN = 117,
  NEW_FUN = 112, VERSION = 131, MAX_ATOM = 255,
  SMALL_INT,INT,SMALL_BIGNUM,LARGE_BIGNUM,FLOAT,ATOM,REF,NEW_REF,PORT,PID,
   SMALL_TUPLE,LARGE_TUPLE,NIL,STRING,LIST,BIN,FUN,NEW_FUN,VERSION,MAX_ATOM,
  assert_equal( <<VERSION,SMALL_INT,1>> , term_to_binary(1) ),
  assert_equal( <<VERSION,INT,0,0,4,210>> , term_to_binary(1234) ),
  assert_equal( <<VERSION,SMALL_BIGNUM,4,0,210,2,150,73>> , term_to_binary(1234567890) ),
  assert_equal( <<VERSION,FLOAT,56,46,49,53,49,54,48,48,48,48,48,48,48,48,48,48,48,49,55,57,48,54,101,43,48,48,0,0,0,0,0>> , term_to_binary(8.1516) ),
  assert_equal( <<VERSION,ATOM,0,3,102,111,111>> , term_to_binary(foo) ),
  assert_equal( <<VERSION,SMALL_TUPLE,3,100,0,5,99,111,111,114,100,97,23,97,42>> , term_to_binary({coord, 23, 42}) ),
  assert_equal( <<VERSION,STRING,0,3,1,2,3>> , term_to_binary([1, 2, 3]) ),
  assert_equal( <<VERSION,NIL>> , term_to_binary([]) ),
  assert_equal( <<VERSION,NIL>> , term_to_binary("") ),
  assert_equal( <<VERSION,STRING,0,1,97>> , term_to_binary("a") ),
  assert_equal( <<VERSION,STRING,0,3,227,132,177>> , term_to_binary("ㄱ") ),
  assert_equal( <<VERSION,LIST,0,0,0,2,100,0,1,97,107,0,2,1,2,NIL>> , term_to_binary([a, [1, 2]]) ),
  assert_equal( <<VERSION,BIN,0,0,0,30,82,111,115,101,115,32,97,114,101,32,114,101,100,0,86,105,111,108,101,116,115,32,97,114,101,32,98,108,117,101>>, term_to_binary(<<"Roses are red\0Violets are blue">>) ),
  assert_equal( <<VERSION,BIN,0,0,0,0>>, term_to_binary(<<>>) ),
  assert_equal( <<VERSION,SMALL_TUPLE,2,100,0,4,98,101,114,116,100,0,3,110,105,108>> , term_to_binary({bert, nil}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,2,100,0,4,98,101,114,116,100,0,4,116,114,117,101>>, term_to_binary({bert, true}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,2,100,0,4,98,101,114,116,100,0,5,102,97,108,115,101>>, term_to_binary({bert, false}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,3,100,0,4,98,101,114,116,100,0,4,100,105,99,116,106>>, term_to_binary({bert, dict, []}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,3,100,0,4,98,101,114,116,100,0,4,100,105,99,116,108,0,0,0,1,104,2,100,0,1,97,97,1,106>>, term_to_binary({bert, dict, [{a, 1}]}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,3,100,0,4,98,101,114,116,100,0,4,100,105,99,116,108,0,0,0,1,LIST,0,0,0,2,100,0,1,97,97,1,106,106>>, term_to_binary({bert, dict, [[a,1]]}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,3,100,0,4,98,101,114,116,100,0,4,100,105,99,116,108,0,0,0,2,104,2,100,0,4,110,97,109,101,109,0,0,0,3,84,111,109,104,2,100,0,3,97,103,101,97,30,106>>, term_to_binary({bert, dict, [{name, <<"Tom">>}, {age, 30}]}) ),
  % 2009-10-11 at 14:12:01 and 446,228 microseconds
  assert_equal( <<VERSION,SMALL_TUPLE,5,100,0,4,98,101,114,116,100,0,4,116,105,109,101,98,0,0,4,231,98,0,4,130,157,98,0,6,207,20>>, term_to_binary({bert, time, 1255, 295581, 446228}) ),
  % 2009-11-03 at 23:19:01
  assert_equal( <<VERSION,SMALL_TUPLE,5,100,0,4,98,101,114,116,100,0,4,116,105,109,101,98,0,0,4,233,98,0,4,110,37,97,0>>, term_to_binary({bert, time, 1257, 290341, 0}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,107,0,8,94,99,40,97,42,41,116,36,108,0,0,0,1,100,0,8,99,97,115,101,108,101,115,115,106>> , term_to_binary({bert, regex, "^c(a*)t$", [caseless]}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,106,106>> , term_to_binary({bert, regex, "", []}) ),
  assert_equal( <<VERSION,SMALL_TUPLE,4,100,0,4,98,101,114,116,100,0,5,114,101,103,101,120,106,108,0,0,0,2,100,0,8,99,97,115,101,108,101,115,115,100,0,9,109,117,108,116,105,108,105,110,101,106>> , term_to_binary({bert, regex, "", [caseless, multiline]}) ),

  true.
