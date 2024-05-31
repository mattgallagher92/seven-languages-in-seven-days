squareBrackets := method(
    l := list();
    call message arguments foreach(arg,
        l push(doMessage(arg))
    );
    l
)

s := "[0, (1 + 1), 5 * 4]"

writeln(s, " evaluates to ", doString(s))
