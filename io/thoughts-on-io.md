# Thoughts on Io

## Day one

- Like the minimal syntax.
- Prototype language is interesting; experienced a bit with JavaScript but never explored deeply.
- The slots concept is cool; it's how I explain objects to newbies anyway.
- Kind of wild that methods are objects that can exist by themselves!

## Day two

- Pretty interesting that what would be keywords in other languages - like while, if etc. - are just messages in Io.
- Cool being able to easily define a new operator and its precendence compared to other operators.
- Being able to quickly make an unless function is really nice!
- There's an error in the edition of the book that I have access to (1st ed.): on page 79 "the deliver method is the object that sent the message" should say "the mailer object is the object that sent the method". I can see from what's written to the console why the author made that mistake, but it caused some confusion when I tried to understand the westley example!
- Working with Io is hard because the documentation is fairly sparse. Sometimes I use `Prototype slotNames sort` to list a prototype's methods and `Prototype getSlot("methodName")` to see method implementations, but I'm really missing IDE autocompletion with method documentaiton shown as I consider which function to use!
- The REPL also leaves a bit to be desired, the arrow keys don't do what I want (move cursor in line or cycle through previous commands)
- Pretty frustrating trying to do stuff like work out how to read a line from stdin!

## Day three

- A custom function for interpreting text between curly brackets is somewhat neat, but doesn't really strike me as grounbreaking compared to other languages. It wouldn't be very hard to write a custom function that does the same thing using FParsec.
- That said, being able to evaluate text as code is interesting. I guess it requires an interpreted language? At the very least, it'd be harder in a compiled language because the code to be evaluated would first have to be compiled.
- Overriding forward is a cool trick but doesn't seem worth the cost. I made a small typo while writing the code and it was hard to debug because the unrecognized message was handled by forward!
- Explicitly yielding control within coroutines seems like a good approach for making control flow obvious. I wonder if this is how the async keyword is implemented in C#, F# and JavaScript.
- The lightweight syntax for making any object into an actor is pretty nice. However, it doesn't feel like there's much boilerplate in F# (using mailbox processors), for example. There's a bit more for frameworks like Akka, but it's not a lot and they provide more guarantees too.
- Futures seem cool; somewhat analagous to F# tasks. Deadlock detection sounds useful, but is maybe trumped by F#'s default guarantees of lack of cycles. I would have liked to have played with them a bit more, but `URL` isn't supported in the version of Io that I'm using.
- Looks to me like there's another mistake: on page 86 it says that the arguments are computed inside out, which implies eager loading to me, but it looks like lazy loading - arguments that I would expect to be a map if eagerly loaded are coming through as messages.

## Overall

- Don't think I particularly like prototype languages, but it's good to think about them more because of JavaScript's popularity.
- Io seems so permissive; I don't feel like I'm being guided into the pit of success.
- The simplicity of message passing is quite cool, and the uniformity means that I feel like I already know the important concepts already..
- The lack of basic quality of life features like a REPL that I can move around in using arrow keys, and good documentaiton is a real drawback.
- I think the balance of syntax sugar is not to my taste. I like a language that's sweeter.
- The language feels almost dead in 2024. It was very hard to find any active communities or information.
