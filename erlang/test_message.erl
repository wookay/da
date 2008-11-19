-module(test_message).
-author('wookay.noh@gmail.com').
-export([main/0]).

assert_equal(Expected, Got) ->
  case Expected==Got of
  true ->
    io:format("passed: ~w~n", [Expected]);
  _ ->
    io:format("Assertion failed\nExpected: ~w\nGot: ~w~n", [Expected, Got])
  end.

echo(Message) ->
  self() ! Message,
  receive
    Recv -> Recv
  end.

main() ->
  assert_equal( 1  , echo(1) ),
  assert_equal( {} , echo({}) ),
  assert_equal( [] , echo([]) ),
  assert_equal( "" , echo("") ),
  true.
