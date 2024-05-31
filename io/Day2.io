// Run in io using `doFile("day_2.io")` in the Io repl.

// Sample in chapter.
unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

princessButtercup := Object clone

westley := Object clone
westley lovesThePrincess := method(princessButtercup unless(trueLove, "It is false" println, "It is true" println))
westley trueLove := true
westley lovesThePrincess
// prints "It is true"

writeln

// Sample in chapter.
// Commented out because it seems to cause weird behaviour (errors) in exercise 3.
/*
Object ancestors := method(
    prototype := self proto
    if(prototype != Object,
    writeln("Slots of ", prototype type, "\n------")
    prototype slotNames foreach(slotName, writeln(slotName))
    writeln
    prototype ancestors))

Animal := Object clone
Animal speak := method("ambiguous" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors

writeln
*/

// Ex 1.
fibRec := method(n,
    if(n < 3,
        1,
        fibRec(n - 1) + fibRec(n - 2)
    )
)
writeln("fibRec(1): ", fibRec(1))
writeln("fibRec(4): ", fibRec(4))
writeln("fibRec(7): ", fibRec(7))

fibIter := method(n,
    if(n < 3,
        1,
        a := 1; b := 1
        for(i, 3, n, oldA := a; a := a + b; b := oldA)
        a
    )
) 
writeln("fibIter(1): ", fibIter(1))
writeln("fibIter(4): ", fibIter(4))
writeln("fibIter(7): ", fibIter(7))

writeln

// Ex 2.
// Commented out because this can't run this multiple times in an io session. In that case the "/" has already been rebound, so would end up in an infinite loop.
/*
oldDiv := Number getSlot("/")
Number / = method(b, if(b == 0, 0, self oldDiv(b)))
writeln("8 / 4: ", 8 / 4)
writeln("8 / 0: ", 8 / 0)
writeln
*/

// Ex 3.
sum2dArray := method(a, a flatten sum)

a := list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9))
writeln("Sum of all elements of ", a, " is ", sum2dArray(a))
writeln

// Ex 4.
List myAverage := method(
    if(self select(x, x type != 0 type) size > 0,
        Exception raise("myAverage given a list which is not all Numbers."),
        if(self size == 0, 0, self sum / self size))
)

b := list (1, 5, 10)
writeln("myAverage of ", b, " is ", b myAverage)
writeln

// Ex 5.
Matrix := Object clone
Matrix fromList := method(l,
    matrix := Matrix clone
    matrix numRows := l first size
    matrix numCols := l size
    matrix internalList := l
    matrix
)
Matrix dim := method(rows, cols,
    l := List clone
    col := List clone
    rows repeat(col push(0))
    cols repeat(l push(col clone))
    Matrix fromList(l)
)
Matrix set := method(row, col, value,
    self internalList at(col - 1) atPut(row - 1, value)
    self
)
Matrix get := method(row, col, self internalList at(col - 1) at(row - 1))
Matrix asString := method(
    s := ""
    for(row, 1, self numRows,
        s = s .. self get(row, 1)
        for(col, 2, self numCols,
            s = s .. ", " .. self get(row, col)
        )
        s = s .. "\n"
    )
)

m := Matrix dim(3, 4)
m set(1, 1, 1)
m set(2, 3, 2)
writeln("item (1, 1) of\n", m, "is ", m get(1, 1), "\n")
writeln("item (1, 2) of\n", m, "is ", m get(1, 2), "\n")
writeln("item (2, 3) of\n", m, "is ", m get(2, 3), "\n")

// Ex 6.
Matrix transpose := method(
    newM := Matrix dim(self numCols, self numRows)
    for(r, 1, self numRows,
        for(c, 1, self numCols,
            newM set(c, r, self get(r, c))
        )
    )
)

writeln("The transpose of\n", m, "is\n", m transpose)
writeln

// Ex 7.
Matrix serialize := method(
    t := self transpose
    t asString
)

f := File with("myMatrix.txt")
f open
f write(m serialize)
f close

Matrix deserialize := method(s,
   // The file stores the transpose, whose rows are the cols of the matrix we want.
   colStrings := s split("\n")
   cols := colStrings map(colString, colString split(", ") map(asNumber))
   Matrix fromList(cols)
)

writeln("After serializing\n", m, "and deserializing it again, we get:\n", Matrix deserialize(f contents))
f remove

// Ex 8.
guessingGame := Object clone do(

    // Would like to use `Random value(1, 100)`, but Random is not supported in my version of Io 🤷
    answer := Object clone uniqueId asNumber % 100 + 1
    remainingGuesses := 10
    lastGuess := nil
    currentGuess := nil

    play := method(

        "Make a guess!" println

        lastGuess = currentGuess
        currentGuess = File standardInput readLine asNumber
        remainingGuesses = remainingGuesses - 1

        currentDistance := (currentGuess - answer) abs
        if(currentDistance == 0,
            "Correct! The answer is #{answer}" interpolate println; "" println,

            if(lastGuess,
                lastDistance := (lastGuess - answer) abs
                if(currentDistance < lastDistance,
                    "Hotter!" println,
                    if(currentDistance > lastDistance,
                        "Colder!" println,
                        "Same temperature 👀" println
                    )
                )
            )

            if(remainingGuesses > 0,
                "#{remainingGuesses} guesses remaining" interpolate println; play(),
                "No more guesses remaining! The answer was #{answer}." interpolate println
            )
        )
    )
)

guessingGame play()

