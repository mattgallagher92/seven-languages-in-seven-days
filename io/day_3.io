Builder := Object clone

OperatorTable addAssignOperator(":", "mapAtPut")
Builder curlyBrackets := method(
    m := Map clone
    call message arguments foreach(arg, 
        m doMessage(arg)
    )
    m
)
Map mapAtPut := method(
    self atPut( 
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1) 
    )
)

Builder depth := -1
Builder indentStr := method(if(depth < 1, "", s := "" asMutable; for(i, 1, depth, s appendSeq("  "))))

Builder forward := method(
    depth = depth + 1

    args := call message arguments
    firstArg := if(args first, self doMessage(args first))
    firstArgIsMap := firstArg type == "Map"

    openingTag := if(firstArgIsMap,

        attributeMap := if(firstArgIsMap, firstArg, Map clone)
        attributes := attributeMap asList map(kvp, "#{kvp first}=\"#{kvp second}\"" interpolate)
        attrs := attributes join(" ")
        "<#{call message name} #{attrs}>" interpolate,

        "<#{call message name}>" interpolate
    )

    innerHtml := "" asMutable
    children := if(firstArgIsMap, args slice(1), args)
    children foreach(arg,
        content := self doMessage(arg)
        // This feels really, really horrible but haven't found a better way...
        if(arg asString beginsWithSeq("\""),
            depth = depth + 1; innerHtml appendSeq("\n#{indentStr}#{content}" interpolate); depth = depth - 1,
            innerHtml appendSeq(content)
        )
    )

    closingTag := "</#{call message name}>" interpolate

    outerHtml := "\n#{indentStr}#{openingTag}#{innerHtml}\n#{indentStr}#{closingTag}" interpolate
    depth = depth - 1
    outerHtml
)

Builder ul(
    li({ "class": "selected", "id": "io" }, "Io"),
    li(span("Lua")),
    li(),
    li("JavaScript")
)

