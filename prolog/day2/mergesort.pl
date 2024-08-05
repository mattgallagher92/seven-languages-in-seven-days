mergesort([], []).
mergesort([X], [X]).
% TODO: this works when Input is defined, but throws an exceptoin when trying to find possible inputs for a given output.
% Would it be possible to modify the definition of this case to make that usage possible?
mergesort(Input, Output) :-
    % Need to constrain to Input of length at least 2, otherwise it is possible to recurse infinitely using this case.
    length(Input, Len), Len > 1,
    % Split Input into (roughly) first half, L, and second half, R.
    HalfLen is Len // 2,
    length(L, HalfLen),
    append(L, R, Input),
    % Calculate sorted L and R.
    mergesort(L, LSorted),
    mergesort(R, RSorted),
    % Unify Output with merged LSorted and RSorted.
    merge(LSorted, RSorted, Output).

merge(L, [], L).
merge([], R, R).
% If the left head is less than or equal to the right head, set the head of the acccumulator to the left head and recurse.
merge([LH|LT], [RH|RT], [LH|AccT]) :- LH =< RH, merge(LT, [RH|RT], AccT).
% If the right head is less than the left head, set the head of the acccumulator to the right head and recurse.
merge([LH|LT], [RH|RT], [RH|AccT]) :- RH < LH, merge([LH|LT], RT, AccT).

% Test with...
% mergesort([3, 5, 2, 9, 8, 6, 1, 4, 7], X).
% mergesort([6, 2, 7, 3, 5, 1, 9, 4, 8, 10], X).

