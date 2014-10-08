-module(calc).
-export([rpn/1, rpn_test/0]).

rpn(L) when is_list(L) ->
    [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " ")),
    Res.

read(N) ->
    case string:to_float(N) of
        {error, no_float} ->
            list_to_integer(N);
        {F, _} -> F
    end.

rpn("+",[N1,N2|S]) ->
    [N2+N1|S];
rpn("-",[N1,N2|S]) ->
    [N2-N1|S];
rpn("*",[N1,N2|S]) ->
    [N2*N1|S];
rpn("/",[N1,N2|S]) ->
    [N2/N1|S];
rpn("^",[N1,N2|S]) ->
    [math:pow(N2,N1) | S];
rpn("ln",[N|S]) ->
    [math:log(N)|S];
rpn("log10",[N|S]) ->
    [math:log10(N)|S];
rpn("sum",Stack) ->
    [sum(Stack)];
rpn("prod",Stack) ->
    [prod(Stack)];
rpn(X,Stack) ->
    [read(X)|Stack].

sum(S) ->
    lists:foldl(fun(X,Y) -> X + Y end, 0, S).

prod(S) ->
    lists:foldl(fun(X,Y) -> X * Y end, 1, S).


rpn_test() ->
    50 = rpn("10 10 10 20 sum"),
    10.0 = rpn("10 10 10 20 sum 5 /"),
    1000.0 = rpn("10 10 20 0.5 prod"),
    ok.

