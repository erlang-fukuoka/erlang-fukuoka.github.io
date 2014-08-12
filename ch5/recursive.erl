-module(recursive).
-export([fac/1,tail_fac/1,len/1,tail_len/1,tail_zip/2,tail_lenient_zip/2,fib/1,tail_fib/1,quicksort/1]).

fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1). 

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1, N*Acc). 

len([]) -> 0;
len([_|T]) -> 1 + len(T). 

tail_len(L) -> tail_len(L, 0).

tail_len([],Acc) -> Acc;
tail_len([_|T],Acc) -> tail_len(T,Acc+1). 

tail_zip(X,Y) -> tail_zip(X,Y,[]).

tail_zip([],[],Acc) -> lists:reverse(Acc);
tail_zip([X|Xs],[Y|Ys],Acc) -> tail_zip(Xs,Ys,[{X,Y}|Acc]).

tail_lenient_zip(X,Y) -> tail_lenient_zip(X,Y,[]).

tail_lenient_zip([],_,Acc) -> lists:reverse(Acc);
tail_lenient_zip(_,[],Acc) -> lists:reverse(Acc); 
tail_lenient_zip([X|Xs],[Y|Ys],Acc) -> tail_lenient_zip(Xs,Ys,[{X,Y}|Acc]). 

fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N-1) + fib(N-2). 

tail_fib(N) -> tail_fib(N,1,1).

tail_fib(1,_,B) -> B;
tail_fib(N,A,B) -> tail_fib(N-1,A+B,A).

quicksort([]) -> [];
quicksort([Pivot|Rest]) -> 
                 {Smaller, Larger} = partition(Pivot, Rest, [], []),
                 quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[],Smaller,Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.
