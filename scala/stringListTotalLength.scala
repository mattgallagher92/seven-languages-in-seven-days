val l = List("a", "list", "of", "strings")
val totalLength = l.foldLeft(0)((acc, s) => acc + s.length)
println("The total length of " + l + " is " + totalLength)

