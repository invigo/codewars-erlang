-module(kata_tests).
-include_lib("eunit/include/eunit.hrl").

basic_test_() ->
  {"Basic tests",
    [{"is_divisible(3, 3, 4)", ?_assertEqual(false, kata:is_divisible(3, 3, 4))},
     {"is_divisible(12, 3, 4)", ?_assertEqual(true, kata:is_divisible(12, 3, 4))},
     {"is_divisible(8, 3, 4)", ?_assertEqual(false, kata:is_divisible(8, 3, 4))},
     {"is_divisible(48, 3, 4)", ?_assertEqual(true, kata:is_divisible(48, 3, 4))},
     {"is_divisible(100, 5, 10)", ?_assertEqual(true, kata:is_divisible(100, 5, 10))},
     {"is_divisible(100, 5, 3)", ?_assertEqual(false, kata:is_divisible(100, 5, 3))},
     {"is_divisible(4, 4, 2)", ?_assertEqual(true, kata:is_divisible(4, 4, 2))},
     {"is_divisible(5, 2, 3)", ?_assertEqual(false, kata:is_divisible(5, 2, 3))},
     {"is_divisible(17, 17, 17)", ?_assertEqual(true, kata:is_divisible(17, 17, 17))},
     {"is_divisible(17, 1, 17)", ?_assertEqual(true, kata:is_divisible(17, 1, 17))}]}.

random_test_() -> {"Random tests", [gen_random() || _ <- lists:seq(1, 100)]}.
sol(N, X, Y) -> (N rem X =:= 0) and (N rem Y =:= 0).
gen_random() ->
  N = rand:uniform(100),
  X = rand:uniform(5),
  Y = rand:uniform(10),
  {"is_divisible(" ++ integer_to_list(N) ++ ", " ++ integer_to_list(X) ++ ", " ++ integer_to_list(Y) ++ ")",
   ?_assertEqual(sol(N, X, Y), kata:is_divisible(N, X, Y))}.