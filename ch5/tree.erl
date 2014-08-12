-module(tree).
-export([empty/0, insert/3 ,lookup/2, create_tree/0]).

empty() -> {node, 'nil'}.

insert(Key, Val, {node, 'nil'}) ->
    {node, {Key, Val, {node, 'nil'},{node, 'nil'}}};
insert(NewKey,NewVal,{node, {Key, Val, Smaller, Larger}}) 
  when NewKey < Key ->
    {node, {Key, Val, insert(NewKey, NewVal, Smaller), Larger}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}})
  when NewKey > Key ->
    {node, {Key, Val, Smaller,insert(NewKey, NewVal, Larger)}};
insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
    {node, {Key, Val, Smaller, Larger}}.

lookup(_,{node, 'nil'}) ->
    undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
    {ok, Val};
lookup(Key, {node, {NodeKey, _, Smaller, _}}) when Key < NodeKey ->
    lookup(Key,Smaller);
lookup(Key, {node, {_, _, _, Larger}}) ->
    lookup(Key, Larger).

create_tree() ->
    T1 = insert("Jim Woodland", "jim.woodland@gamil.com", empty()), 
    T2 = insert("Mark Anderson", "i.am.a@hotmail.com",T1),
    T3 = insert("Anita Bath", "abath@someuni.edu.",T2),
    T4 = insert("Kevin Robert", "myfairy@yahoo.com",T3),
    insert("wilson Longbrow","longwil@gmail.com",T4).
