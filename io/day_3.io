Builder := Object clone

Builder depth := -1
Builder printIndent := method(for(i, 1, depth, "  " print))

Builder forward := method(
    depth = depth + 1

    printIndent; writeln("<", call message name, ">")

    call message arguments foreach(arg,
        content := self doMessage(arg);
        if (content type == "Sequence", printIndent; writeln(content))
    )

    printIndent; writeln("</", call message name, ">")

    depth = depth - 1
)

Builder ul(
    li("Io"),
    li(span("Lua")),
    li("JavaScript")
)

