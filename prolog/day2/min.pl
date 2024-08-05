min([X], X).
min([Head|Tail], Min) :-
    % Exclude emtpy tails to make distinct from previous clause.
    length(Tail, L), L > 0,
    min(Tail, MT), ( Head < MT -> Min = Head; Min = MT ).
