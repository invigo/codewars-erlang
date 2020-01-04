-module(tests).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

basic_test_() ->
    {"Basic tests",
        [{"Test I", "Returns \"es\" for \"test\".",
          ?_assertEqual("es", solution:middle("test"))},
         {"Test II", "Returns \"t\" for \"testing\".",
          ?_assertEqual("t", solution:middle("testing"))},
         {"Test III", "Returns \"dd\" for \"middle\".",
          ?_assertEqual("dd", solution:middle("middle"))},
         {"Test IV", "Returns \"A\" for \"A\".",
          ?_assertEqual("A", solution:middle("A"))}]}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proper_middle("") -> "";
proper_middle(String) when length(String) rem 2 =:= 1 ->
    [lists:nth(length(String) div 2 + 1, String)];
proper_middle(String) when length(String) rem 2 =:= 0 ->
    lists:sublist(String, length(String) div 2, 2).

random_string(Length) ->
    Characters = list_to_tuple("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"),
    CharactersSize = size(Characters),
    Fun = fun(_, RandomString) ->
            [element(rand:uniform(CharactersSize), Characters) | RandomString] end,
    lists:foldl(Fun, "", lists:seq(1, Length)).

single_random_test(Nth) ->
    RandomString = random_string(Nth),
    Solution = solution:middle(RandomString),
    {"Random test number " ++ integer_to_list(Nth),
     "Returns \"" ++ Solution ++ "\" for \"" ++ RandomString ++ "\".",
     ?_assertEqual(proper_middle(RandomString), solution:middle(RandomString))}.

random_test_() ->
    RandomTestFun = fun(Nth, RandomTests) ->
                              [single_random_test(Nth) | RandomTests] end,
    RandomTests = lists:foldl(RandomTestFun, [], lists:seq(1, 100)),
    {"Random tests", lists:reverse(RandomTests)}.