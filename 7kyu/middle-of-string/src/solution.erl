-module(solution).
-export([middle/1]).

-spec middle(string()) -> string().
middle(String) ->
    Len = string:length(String),
    Midx = Len div 2,
    case Len rem 2 =:= 0 of
      true -> lists:sublist(String, Midx, 2);
      false -> lists:sublist(String, Midx + 1, 1)
    end.
