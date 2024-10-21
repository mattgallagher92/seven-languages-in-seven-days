-module(day_2).

-export([value_for_keyword/2]).
-export([subtotals/1]).
-export([tic_tac_toe_result/1]).

value_for_keyword(_, []) -> not_found;
value_for_keyword(Keyword, [{Keyword, V} | _]) -> V;
value_for_keyword(Keyword, [_ | T]) -> value_for_keyword(Keyword, T).

%day_2:value_for_keyword(dog, [{mouse, "Squeak"}, {cat, "Meow"}]).
%not_found
%day_2:value_for_keyword(dog, [{mouse, "Squeak"}, {cat, "Meow"}, {dog, "Woof"}]).
%"Woof"

subtotals(ShoppingList) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

% subtotals([{onions, 3, 0.50}, {tomatoes, 2, 0.59}, {mushrooms, 10, 0.12}]).
% [{onions,1.5},{tomatoes,1.18},{mushrooms,1.2}]

% Expects x and o as player marks. Anything else, e.g. e, can be used for empty cells.
tic_tac_toe_result(Input) ->
    {Tl, Tm, Tr, Ml, Mm, Mr, Bl, Bm, Br} = Input,

    LCol = {Tl, Ml, Bl},
    MCol = {Tm, Mm, Bm},
    RCol = {Tr, Mr, Br},

    TRow = {Tl, Tm, Tr},
    MRow = {Ml, Mm, Mr},
    BRow = {Bl, Bm, Br},

    TlToBrDiag = {Tl, Mm, Br},
    TrToBlDiag = {Tr, Mm, Bl},

    Lines = [LCol, MCol, RCol, TRow, MRow, BRow, TlToBrDiag, TrToBlDiag],

    XHasWon = lists:member({x, x, x}, Lines),
    OHasWon = lists:member({o, o, o}, Lines),
    SomeCellsAreEmpty = lists:any(fun(S) -> S =/= x andalso S =/= o end, tuple_to_list(Input)),

    if XHasWon ->
           x;
       OHasWon ->
           o;
       SomeCellsAreEmpty ->
           no_winner;
       true ->
           % Don't get why it's "cat", that's just what the exercise says...
           cat
    end.

%day_2:tic_tac_toe_result({x, o, x, o, x, e, x, e, o}).
%x
%day_2:tic_tac_toe_result({o, x, o, x, x, o, x, o, x}).
%cat
%day_2:tic_tac_toe_result({o, o, o, x, o, x, x, e, x}).
%o
%day_2:tic_tac_toe_result({x, e, e, e, o, e, e, e, e}).
%no_winner
