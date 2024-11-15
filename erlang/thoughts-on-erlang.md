# Thoughts on Erlang

## Introduction

- Interesting that Ericsson decided that existing languages were inadequate for their needs. Promising to know that it was designed to solve an actual problem.
- Making processes as lightweight as possible to enable "let it crash" is an interesting idea! I'm keen to see "nondefensive programming"!
- Hot swapping also sounds intriguing.
- I like what I've seen of Prolog, so cool to know that Erlang started from it.

## Day one

- Statements ending in a period is unusual!
- A list of integers being the same as a string is very unusal!
- Would slightly prefer no type coercion (e.g. integer to float), but I can live with it.
- Having such easy access to atoms is cool.
- Building data types up from tuples and tagging the values with atoms is cool. Feels like a very minimal way to get complex data types.
- Pattern matching seems strong.
- Packing data into a specified number of bits is cool.
- Not sure that I like the dynamic typing 😅
- Particularly dislike that you don't get a compiler warning you about non-exhaustive pattern matching.
- Quite like explicit module exports.
- Integers are big 😳

## Day two

- Like case expressions, ifs are okay. Again feels weird without exhaustive matching.
- `lists` module seems to have a good range of functions.
- List comprehenstions are nice.
- I find declaring different patterns for the same functions as separate code elements a bit odd.
