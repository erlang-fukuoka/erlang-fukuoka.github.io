-module(timeout).
-compile(export_all).

push(Pid) ->
    Pid ! {self(), push},
    receive
        back ->
            comfirm
    after 1000 ->
            timout
    end.

wait() ->
    receive 
        {From, push} ->
            timer:sleep(3000),
            From ! back
    end.

            
