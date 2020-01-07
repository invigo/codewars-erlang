-module(kata).
-export([max_multiple/2]).

max_multiple(D, B) -> 
    lists:max([X || X <- lists:seq(0, B),
                         lists:any(fun(M) -> if
                                                X rem M =:= 0 -> true;
                                                true -> false
                                             end
                                   end, 
                                   [D])]).

% OR

% max_multiple(D, B) -> 
%     B - B rem D.