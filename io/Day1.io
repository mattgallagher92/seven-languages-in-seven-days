// Run in io using `doFile("day_1.io")` in the Io repl.

1 + 1
// ==> 2

// 1 + "one"
//  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
//  ---------
//  message '+' in 'Command Line' on line 1

// Io is somewhat strongly typed: 1 + "one" gives an exception saying the argument must be a number.
// However, coercion of values into bools (below) means it could be stronger.

true and 0
// ==> true

true and ""
// ==> true

true and nil
// ==> false

A := Object clone
// Returns list of supported slots.
A slotNames

//   = sets the value in a slot if the slot exists (fails otherwise).
//  := sets the value in a slot, creating the slot if it doesn't exist.
// ::= set the value in a slot and created a setter for that slot.

a := A clone
a s := "s"
a s = "t"
a u ::= "u"
a setU("v")
a s
// ==> "t"
a u
// ==> "v"

a code := "1 + 1"
doString(a code)
// ==> 2

a m := method("Executed m" println)
a m
// prints "Executed m"
