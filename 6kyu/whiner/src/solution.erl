-module(solution).
-export([whiner/1, whine/1]). %% perhaps some changes here
-import(timer, [sleep/1]).

-spec whiner(pid()) -> done.
whiner(Parent) ->
    % io:format(user, "~s~n", ["Should you need to print something,"
    %                          ++ "write to user stream, like this."]),
    receive_msgs(undefined, Parent).

% Auxiliary

-spec receive_msgs(pid() | undefined, pid()) -> done.
receive_msgs(Whiner, Target) ->
    receive
        {awake} when Whiner =:= undefined -> 
            New = spawn(whiner, whine, [Target]),
            receive_msgs(New, Target);
        {give_up} ->
            if
                Whiner =/= undefined ->
                    exit(Whiner, shut_up),
                    done;
                true ->
                    done
            end;
        _MalformedMessage -> 
            receive_msgs(Whiner, Target)
    end.   

-spec whine(pid()) -> no_return.
whine(Target) ->
    Target ! {whine, "anybody listening ?"},
    sleep(1000),
    whine(Target).