-module(lisp).
-export([eval/0, split/2]).

eval() ->
    0.

split(Key,List) ->
    lists:reverse(split(Key,List,[],[])).
split(_,[],[],Result) -> list:reverse(Result);
split(_,[],Word,Result) -> [list:reverse(Word)|Result];
split(Key,[Key|T],Word,Result) -> split(Key,T,[],[lists:reverse(Word)|Result]);
split(Key,[H|T],Word,Result) -> split(Key,T,[H|Word],Result).

eval_ast({add,1,2,{mul,3,4},{mul,5,6}})
