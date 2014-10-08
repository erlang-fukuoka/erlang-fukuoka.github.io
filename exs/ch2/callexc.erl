-module(callexc).
-export([callexc/0]).

callexc() ->
    'Elixir.Useless':add(10,20).
