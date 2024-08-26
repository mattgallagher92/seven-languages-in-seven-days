// This problem is very poorly defined - what exactly does the author want me to do?
trait Censor {
  val appropriateWords = {
    val m = new scala.collection.mutable.HashMap[String, String]
    val pairs =
      scala.io.Source.fromFile("./alternativeWords.txt")
        .getLines()
        .filter(l => !l.isEmpty)
        .foreach(l => {
          val parts = l.split(", ")
          m += parts(0) -> parts(1)
        })
    m
  }

  def censor(s: String) = appropriateWords.foldLeft(s)((acc, kvp) => acc.replaceAll(kvp._1, kvp._2))
}

class Program(s: String) extends Censor {
  def censored() = censor(s)
}

val p = new Program("Aw Shoot! I forgot my Darn beans!")

println(p.censored())
