class Board(
  var tl: Char, var tm: Char, var tr: Char,
  var ml: Char, var mm: Char, var mr: Char,
  var bl: Char, var bm: Char, var br: Char) {

  def this() = this(' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ')

  def lCol() = (tl, ml, bl)
  def mCol() = (tm, mm, bm)
  def rCol() = (tr, mr, br)

  def tRow() = (tl, tm, tr)
  def mRow() = (ml, mm, mr)
  def bRow() = (bl, bm, br)

  def tlToBrDiag() = (tl, mm, br)
  def trToBlDiag() = (tr, mm, bl)
  
  def cells() = List(tl, tm, tr, ml, mm, mr, bl, bm, br)
  def lines() = Set(lCol(), mCol(), rCol(), tRow(), mRow(), bRow(), tlToBrDiag(), trToBlDiag())

  def emptyCells() = {
    var cs = scala.collection.mutable.Set[String]()
    if (tl == ' ') {
      cs += "tl"
    }
    if (tm == ' ') {
      cs += "tm"
    }
    if (tr == ' ') {
      cs += "tr"
    }
    if (ml == ' ') {
      cs += "ml"
    }
    if (mm == ' ') {
      cs += "mm"
    }
    if (mr == ' ') {
      cs += "mr"
    }
    if (bl == ' ') {
      cs += "bl"
    }
    if (bm == ' ') {
      cs += "bm"
    }
    if (br == ' ') {
      cs += "br"
    }
    cs
  }

  def xCount() = cells().count(c => c == 'X')
  def oCount() = cells().count(c => c == 'O')
  def emptyCount() = cells().count(c => c == ' ')

  def xHasWon() = lines().contains(('X', 'X', 'X'))
  def oHasWon() = lines().contains(('O', 'O', 'O'))

  def finished() = xHasWon() || oHasWon() || emptyCount() == 0

  def result() = {
    if (xHasWon()) {
      "X has won"
    }
    else if (oHasWon()) {
      "O has won"
    }
    else if (emptyCount() > 0) {
      "Ongoing"
    }
    else {
      "Tie"
    }
  }

  def nextPlayer() = {
    if (finished()) {
      '-'
    }
    else if (xCount() == oCount()) {
      'X'
    }
    else {
      'O'
    }
  }

}

// Tests
//
// val b1 = new Board(' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ')
// println("b1 result: " + b1.result())
//
// val b2 = new Board('X', 'X', 'X', 'O', 'O', ' ', ' ', ' ', ' ')
// println("b2 result: " + b2.result())
//
// val b3 = new Board('X', 'O', 'X', 'X', 'O', 'X', ' ', 'O', ' ')
// println("b3 result: " + b3.result())
//
// val b4 = new Board('X', 'O', 'X', 'X', 'O', 'X', 'O', ' ', 'O')
// println("b4 result: " + b4.result())
//
// b4.bm = 'X'
// println("b4 result: " + b4.result())

val b = new Board()
def printB() = {
  println()
  println(b.tl + "|" + b.tm + "|" + b.tr)
  println("- - -")
  println(b.ml + "|" + b.mm + "|" + b.mr)
  println("- - -")
  println(b.bl + "|" + b.bm + "|" + b.br)
  println()
}

while (b.nextPlayer() != '-') {
  printB()

  val cs = b.emptyCells()
  val next = b.nextPlayer()
  println(s"$next, choose an empty square from " + cs.toList.sorted + ": ")

  val l = scala.io.StdIn.readLine()
  if (!cs.contains(l)) {
    println(l + " is not an empty cell")
  }

  if (l == "tl") {
    b.tl = next
  }
  if (l == "tm") {
    b.tm = next
  }
  if (l == "tr") {
    b.tr = next
  }
  if (l == "ml") {
    b.ml = next
  }
  if (l == "mm") {
    b.mm = next
  }
  if (l == "mr") {
    b.mr = next
  }
  if (l == "bl") {
    b.bl = next
  }
  if (l == "bm") {
    b.bm = next
  }
  if (l == "br") {
    b.br = next
  }
}

printB()
println(b.result())
