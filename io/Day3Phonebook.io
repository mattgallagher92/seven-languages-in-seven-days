OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg, 
        r doMessage(arg)
    )
    r
)

Map atPutNumber := method(
    self atPut( 
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1) 
    )
)

s := File with("phonebook.txt") openForReading contents
phoneNumbers := doString(s)

writeln("Bob Smith's number is: ", phoneNumbers at("Bob Smith"))
writeln("David Jones's number is: ", phoneNumbers at("David Jones"))
writeln("Mary Walsh's number is: ", phoneNumbers at("Mary Walsh"))
