-module(tests).

-import(timer, [sleep/1]).
-include_lib("eunit/include/eunit.hrl").

example_test_() ->
    Msg = "Testing if process dies on request.",
    register(whiner, spawn(solution, whiner, [self()])),
    whiner ! {give_up},
    timer:sleep(100),
    {"Example test", Msg, ?_assertEqual(undefined, whereis(whiner))}.
