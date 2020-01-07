-module(kata_tests).
-include_lib("eunit/include/eunit.hrl").

basic_test_() ->
  {"Basic tests",
    [{"max_multiple(2, 7)", ?_assertEqual(6, kata:max_multiple(2, 7))},
     {"max_multiple(3, 10)", ?_assertEqual(9, kata:max_multiple(3, 10))},
     {"max_multiple(7, 17)", ?_assertEqual(14, kata:max_multiple(7, 17))},
     {"max_multiple(10, 50)", ?_assertEqual(50, kata:max_multiple(10, 50))},
     {"max_multiple(37, 200)", ?_assertEqual(185, kata:max_multiple(37, 200))},
     {"max_multiple(7, 100)", ?_assertEqual(98, kata:max_multiple(7, 100))}]}.

random_test_() -> {"Random tests", [gen_random() || _ <- lists:seq(1, 100)]}.
sol(D, B) -> B - B rem D.
gen_random() ->
  D = rand:uniform(1000),
  B = rand:uniform(1001000) + 999,
  {"max_multiple(" ++ integer_to_list(D) ++ ", " ++ integer_to_list(B) ++ ")",
    ?_assertEqual(sol(D, B), kata:max_multiple(D, B))}.