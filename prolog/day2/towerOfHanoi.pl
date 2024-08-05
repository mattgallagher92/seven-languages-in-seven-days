% swap(X, Y, Move, Swapped) holds when Swapped is the result of replacing move(N, X) with move(N, Y) and vice versa.
swap(X, Y, move(N, X), move(N, Y)).
swap(X, Y, move(N, Y), move(N, X)).
swap(X, Y, move(N, Z), move(N, Z)) :- Z \= X, Z \= Y.

% swapMany(X, Y, Moves, Swapped) holds when Swapped is the same as Moves except move(N, X) is replaced by move(N, Y) and move(N, Y) is replaced by move(N, X).
swapMany(X, Y, [], []).
swapMany(X, Y, [H|T], [SH|ST]) :- swap(X, Y, H, SH), swapMany(X, Y, T, ST).

% towerOfHanoi(N, Solution) gets N discs labelled 1 (small) to N (big) from rod a to rod c, via rod b.
towerOfHanoi(1, [ move(1, c) ]).
towerOfHanoi(N, Solution) :-
    N > 1, N1 is N - 1,
    % S1 gets first N-1 discs from a to c via b.
    towerOfHanoi(N1, S1),
    % S1bc gets first N-1 discs from a to b via c.
    swapMany(b, c, S1, S1bc),
    % S1ab gets first N-1 discs from b to c via a.
    swapMany(a, b, S1, S1ab),
    append(S1bc, [move(N, c)|S1ab], Solution).

% Can test with following examples...
% towerOfHanoi(2, [ move(1, b), move(2, c), move(1, c) ]).
% towerOfHanoi(3, [ move(1, c), move(2, b), move(1, b), move(3, c), move(1, a), move(2, c), move(1, c) ]).

