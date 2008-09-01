-module(numero).
-author('wookay.noh@gmail.com').
-export([numero/0]).

assert_equals(Expected, Got) ->
  case (Expected == Got) of
    true ->
      io:format("true: ~w~n", [Expected]);
    _ ->
      io:format("Assertion failed~nExpected: ~w~nGot: ~w~n", [Expected, Got])
  end.

numero() ->
  [Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten] =
    lists:seq(0,10),
   Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten,

  assert_equals(Six, One + Two + Three),
  assert_equals(Six, One * Two * Three),
  assert_equals(true, One + Two == Three),
  assert_equals(true, One < Two),
  assert_equals(3, One + Two),
  assert_equals(Six, 1 + 2 + 3),
  assert_equals(Six, 1 + 2 + Three).
