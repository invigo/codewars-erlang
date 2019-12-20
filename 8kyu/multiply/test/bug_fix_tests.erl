-module(bug_fix_tests).
-include_lib("eunit/include/eunit.hrl").

multiply_test_() ->
  {"multiply", [{"multiply(1, 1)", ?_assertEqual(1, bug_fix:multiply(1, 1))},
                {"multiply(2, 1)", ?_assertEqual(2, bug_fix:multiply(2, 1))},
                {"multiply(2, 2)", ?_assertEqual(4, bug_fix:multiply(2, 2))},
                {"multiply(3, 5)", ?_assertEqual(15, bug_fix:multiply(3, 5))}]}.
                
random_test_() -> {"multiply random integers", gen_tests(30)}.
gen_tests(N) ->
  {generator,
   fun () ->
     case N > 0 of
       true ->
         A = rand:uniform(100),
         B = rand:uniform(100),
         [{list_to_binary(io_lib:format("multiply(~tw, ~tw)", [A, B])),
           ?_assertEqual(A * B, bug_fix:multiply(A, B))}
          | gen_tests(N-1)];
       _ -> []
     end
   end}.