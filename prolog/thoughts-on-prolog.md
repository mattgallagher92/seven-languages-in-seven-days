# Thoughts on Prolog

## Day one

- Defining rules from facts seems pretty simple.
- I like the constraints of the language so far (no instructions). It feels similar to first learning functional programming, having mutability taken away and having to find new approaches to common problems.
- Expressions like `likes(wallace, cheese)` read a little clumsily. Something closer to natural language would be nice.
- Debugging is hard - I made a typo in `Mississippi`, which resulted in a reduction in constraints, hence duplicate results in my list of solutions. It wasn't immediately obvious to me that the cause was a typo.
- I can see that Prolog is well suited to the problems that Brian describes when interviewed: modelling a research dolphin's understanding of commands and schedule planning.
- It seems that what I've seen so far could be achieved in F# by generating a collection of all the possible inputs and filtering to only those that meet a constraint. I wonder if Prolog offers more to make it worth breaking out of my preferred programming language. I can perhaps already see that the ergonomics of the language make the dolphin simulator more pleasant to write in Prolog than in F#.

## Day two

- Unification feels conceptually similar to pattern matching. However, it's clear that being able to match on both sides, as exemplified by `append` is really powerful. Calculating which two lists could be appended to give two lists (`append(One, Two, [apples, oranges, bananas]).`) blew me away. I'm not certain of a simple generic approach that I'd use for such a problem in F#.
- What's even better is that something that surprised me with its power has such a simple implementation.
- Not being able to use `N - 1` as a subexpression and having to unify it with something else first, for example `N1 is N - 1`, feels slightly weird.
- Took me a little bit of time to get my head around the required syntax for affecting the "result" of a "function", as it's just an expression in a rule (particularly noticable in the merge rule in [./day2/merge.pl](./day2/merge.pl)).
- Negation is a little fiddly. I might want to express that `X` is not some value, `a`, as `\+ X = a`. That goal fails if `X` is a free variable at the point of evaluation, because its negation (the goal `X = a`) is provable when `X` has the value `a`. If you want to exclude certain values, you need to make sure that such a negated goal comes at a point where all of its variables have been bound to something.
- I'm still struggling to think in Prolog. I'm having to translate into it, which is possible but currently time consuming and error prone.

