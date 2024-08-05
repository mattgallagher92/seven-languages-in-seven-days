rev(L, R) :- rev_internal(L, [], R).

rev_internal([], Acc, Acc).
rev_internal([H|T], Acc, Result) :- rev_internal(T, [H|Acc], Result).
