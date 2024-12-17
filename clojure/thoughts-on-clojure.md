# Thoughts on Clojure

## Day one

- Seems practical and pragmatic.
- Prefix notation takes some getting used to, but I can see the benefits! I particularly like that how I read the code is so similar to how the code is evaluated.
- I like keywords! Weird but useful that they can be used like functions for lookups; guess there's maybe a protocol that makes that work?
- Looks like there's a good assortment of basic collections.
- Function definition seems fairly simple; using different collection types to distinguish between parameters and the body is a nice quality-of-life choice.

## Day two

- Lack of tail-recursion optimisation is a slight annoyance.
- Sequence functions seem fully featured.
- I like the left-to-right operator (`->>`); it feels like pipelines in F#!
- Protocols and records seem sensible.
- Using maps in place of types (e.g. for stubbing during testing) seems like an interesting idea.
- Macros and macro expansion look very powerful 👀

## Day three

- Transactional memory with refs is a pretty cool idea! It also makes a lot of sense - the transaction has proven to be a great abstraction when working with databses to help simplify a large class of concurrency problems down to a transaction abort. Why not apply the same idea in code? It makes me wonder why I haven't seen it before!
- Similarly using agents for serialised updates (a bit like actors but without encapsulation) is a neat idea.
- Atoms aren't quite so particular to Clojure but it's still good to know that they're there.

## Overall

- I like what I've seen! Immutabilty/FP suits me well and the standard library seems fully-featured. Java interop presumably means plenty of access to libraries/SDKs too.
- The concurrency primitives seem good and interesting.
- I _really_ like the look of macros.
- More generally, I find the idea of working with a Lisp pretty appealing.
- There are a lot of parentheses 😅 but the language server provides enough assistance (matching assistance and auto-indentation) for that not to be particularly troublesome.
- Lots to like and lots of interesting ideas. Perhaps worth deeper exploration in future.
