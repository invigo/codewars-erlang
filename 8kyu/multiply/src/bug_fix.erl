-module(bug_fix).
-export([multiply/2]).

-spec multiply(integer(), integer()) -> integer().
multiply(A, B) when is_integer(A) andalso 
                    is_integer(B) -> 
    A * B.