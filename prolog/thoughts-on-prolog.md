# Thoughts on Prolog

## Day one

- Defining rules from facts seems pretty simple.
- I like the constraints of the language so far (no instructions). It feels similar to first learning functional programming, having mutability taken away and having to find new approaches to common problems.
- Expressions like `likes(wallace, cheese)` read a little clumsily. Something closer to natural language would be nice.
- Debugging is hard - I made a typo in `Mississippi`, which resulted in a reduction in constraints, hence duplicate results in my list of solutions. It wasn't immediately obvious to me that the cause was a typo.
- I can see that Prolog is well suited to the problems that Brian describes when interviewed: modelling a research dolphin's understanding of commands and schedule planning.
- It seems that what I've seen so far could be achieved in F# by generating a collection of all the possible inputs and filtering to only those that meet a constraint. I wonder if Prolog offers more to make it worth breaking out of my preferred programming language. I can perhaps already see that the ergonomics of the language make the dolphin simulator more pleasant to write in Prolog than in F#.

