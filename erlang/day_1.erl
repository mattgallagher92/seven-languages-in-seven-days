-module(day_1).

-export([num_words/1]).
-export([count_to_ten/0]).
-export([print_result/1]).

num_words("") -> 0;
% Simplifying assumption: String contains words separated by single spaces.
num_words(String) -> words(String, 1).

words("", Num) -> Num;
% 32 is the Unicode code point for a space.
words([32 | T], Num) -> words(T, Num + 1);
words([_ | T], Num) -> words(T, Num).

count_to_ten() -> count_to_ten(1).

% TODO: how to avoid returning something here?
count_to_ten(11) -> [];
count_to_ten(X) ->
    io:format("~p~n", [X]),
    count_to_ten(X + 1).

print_result(success) -> "success";
print_result({error, Message}) -> "error: " ++ Message.
