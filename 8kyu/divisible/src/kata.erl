-module(kata).
-export([is_divisible/3]).

is_divisible(N, X, Y) ->
  case is_divisible(N, X) of
    true -> is_divisible(N, Y);
    _ -> false
  end.
  
is_divisible(N, X) ->
  N rem X =:= 0.