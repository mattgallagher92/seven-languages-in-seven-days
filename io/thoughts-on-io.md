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

