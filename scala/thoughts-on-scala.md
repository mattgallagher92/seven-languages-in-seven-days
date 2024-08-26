# Thoughts on Scala

## Day one

- Scala seems to occupy a somewhat similar place on the JVM to what F# does on the .NET CLR.
- Lots to like: type inference; terse syntax; range expressions; tuples.
- I don't mind having braces - makes Vim motions slightly easier to scope.
- Traits seem cool.
- The REPL seems quite nice and it's easy to run programs from a file.

## Day two

- Some nice features for a functional style: easy immutable variables and collection types with higher-order functions.
- I would actually prefer that mutability was harder; seems that Scala doesn't discourage it as much as F# (`val`/`var` vs `let`/`let mutable`).
- Don't quite get the point of `Any` and `Nothing`.
- The `/:` syntax seems very strange! And I'm not sure why `foldLeft` takes one parameter and returns a function, rather than taking two...
