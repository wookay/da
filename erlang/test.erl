-module(test).
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
  assert_equal( 1    , 1    ),
  assert_equal( 3    , 1+2  ),
  assert_equal( "a"  , [$a] ),
  assert_equal( 1    , 1=1  ),
  assert_equal( true , 1==1 ),
  assert_equal( 1    , 1/3+1/3+1/3 ),
  true.
