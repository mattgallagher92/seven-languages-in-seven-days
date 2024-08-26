// This problem is very poorly defined - what exactly does the author want me to do?
trait Censor {
  val appropriateWords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  def censor(s: String) = appropriateWords.foldLeft(s)((acc, kvp) => acc.replaceAll(kvp._1, kvp._2))
}

class Program(s: String) extends Censor {
  def censored() = censor(s)
}

val p = new Program("Aw Shoot! I forgot my Darn beans!")

println(p.censored())
