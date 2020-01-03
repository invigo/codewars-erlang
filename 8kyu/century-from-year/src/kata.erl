-module(kata).
-export([century/1]).

century(Year) ->
  case Year rem 100 =:= 0 of 
    true  -> Year div 100;
    false -> Year div 100 + 1
  end.