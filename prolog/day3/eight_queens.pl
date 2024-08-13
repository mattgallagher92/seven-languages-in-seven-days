valid_queen(Col) :- member(Col, [1,2,3,4,5,6,7,8]).
valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

% diags1(1, Board, Diags1) is true if Diags1 is the indices of the top-right to bottom-left diagonals that the queens
% are on, in order, given by the difference between the column and the row.
diags1(9, [], []).
diags1(Row, [Col|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col - Row,
  R1 is Row + 1,
  diags1(R1, QueensTail, DiagonalsTail).

% diags2(1, Board, Diags2) is true if Diags2 is the indices of the top-left to bottom-right diagonals that the queens
% are on, in order, given by the sum of the column and the row.
diags2(9, [], []).
diags2(Row, [Col|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col + Row,
  R1 is Row + 1,
  diags2(R1, QueensTail, DiagonalsTail).

% True if Board is a list of 8 numbers from 1 to 8, where the 1-based index represents the row
% a queen is in, and the value represents the column that that queen is in.
eight_queens(Board) :-
  length(Board, 8),
  valid_board(Board),

  % All queens in different columns.
  fd_all_different(Board),

  % All queens in different top-right to bottom-left diagonals.
  diags1(1, Board, Diags1),
  fd_all_different(Diags1),

  % All queens in different top-left to bottom-right diagonals.
  diags2(1, Board, Diags2),
  fd_all_different(Diags2).
