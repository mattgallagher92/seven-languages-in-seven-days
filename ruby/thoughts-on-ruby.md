# Ruby

## Thoughts

### Day 1

- 'puts' and 'gets' for writing to and reading from stdout is interesting. A bit more vivid than usual names.
- Cool that you can put if/unless at the end of lines! Reads a bit more like English.
- Interesting that numbers are classes.
- I like `unless` and `until` (opposite behaviour of `if` and `while`).
- Funny working in dynamically-typed language and seeing undeclared variables being fine if the code path doesn't hit them!
- Nice to see some strong typing; JavaScript's type coercion scares me!
- Duck typing is cool.

### Day 2

- Didn't pick up on this yesterday - nice that functions don't have to be associated to classes!
- Feels kind of weird having one collection type (arrays) with the behaviour for queues, linked lists, stacks and sets. Convenient in a way, but must be hard to optimise.
- :symbols are interesting as an easily-defined singleton.
- Using hashes for named params is cool.
- Intesresting that it's possible to extend classes with new functions.
- Like that code blocks can be passed around as first-class objects (yield/.call).
- Mixins are interesting. It's kind of like having interfaces with extension methods, all neatly defined in once place.
- Feels weird that collect and map are the same.
- Don't like the name 'inject' for fold/reduce, but good to know that it's available.
- Having methods on strings like 'include?' that take Regexps is nice.

### Day 3

- The extent to which classes are open to modification is interesting. Being able to redefine existing methods is different to what I'm used to! But the ability to add new ones seems pretty handy.
- Open classes and duck typing in particular seem to play nicely together.
- Adding method like inches, feet, yards and miles to the numeric class is wild! 10.miles.back is so expressive!
- Using `method_missing` enables pretty cool expressivity but looks dangerous 👀
- Metaprogramming seems powerful, particularly adding instance methods via mixins and macros using `define_method`!

### Overall

- Duck typing and open classes are pleasant to work with.
- I like symbols and mixins.
- Very easy to write expressive code!
- The reported lack of IDE assistance is a potential worry. Would need to explore further to come to any firm conclusions though.
- Would like to experiment with Rails.
