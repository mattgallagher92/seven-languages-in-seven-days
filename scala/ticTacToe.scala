class Board(
  var tl: Char, var tm: Char, var tr: Char,
  var ml: Char, var mm: Char, var mr: Char,
  var bl: Char, var bm: Char, var br: Char) {

  def lCol() = (tl, ml, bl)
  def mCol() = (tm, mm, bm)
  def rCol() = (tr, mr, br)

  def tRow() = (tl, tm, tr)
  def mRow() = (ml, mm, mr)
  def bRow() = (bl, bm, br)

  def tlToBrDiag() = (tl, mm, br)
  def trToBlDiag() = (tr, mm, bl)
  
  def cells() = Set(tl, tm, tl, ml, mm, mr, bl, bm, br)
  def lines() = Set(lCol(), mCol(), rCol(), tRow(), mRow(), bRow(), tlToBrDiag(), trToBlDiag())

  def result() = {
    if (lines().contains(('X', 'X', 'X'))) {
      "X has won"
    }
    else if (lines().contains(('O', 'O', 'O'))) {
      "O has won"
    }
    else if (cells().contains(' ')) {
      "Ongoing"
    }
    else {
      "Tie"
    }
  }

}

// Tests
val b1 = new Board(' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ')
println("b1 result: " + b1.result())

val b2 = new Board('X', 'X', 'X', 'O', 'O', ' ', ' ', ' ', ' ')
println("b2 result: " + b2.result())

val b3 = new Board('X', 'O', 'X', 'X', 'O', 'X', ' ', 'O', ' ')
println("b3 result: " + b3.result())

val b4 = new Board('X', 'O', 'X', 'X', 'O', 'X', 'O', ' ', 'O')
println("b4 result: " + b4.result())

b4.bm = 'X'
println("b4 result: " + b4.result())
