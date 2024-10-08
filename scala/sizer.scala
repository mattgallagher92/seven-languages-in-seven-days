import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageSizeAndLinkCount(url : String) = {
    val sourceString = Source.fromURL(url).mkString
    val linkCount = "</a>".r.findAllIn(sourceString).length
    (sourceString.length, linkCount)
  }
}

val urls = List("http://www.google.co.uk/",
               "http://www.google.com/",
               "http://www.google.ca/")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeAndLinkCountSequentially() = {
  for(url <- urls) {
    println("Size and link count for " + url + ": " + PageLoader.getPageSizeAndLinkCount(url))
  }
}

def getPageSizeAndLinkCountConcurrently() = {
  // `self` is apparently an implicit actor associated with the current execution context.
  val caller = self

  for(url <- urls) {
    // Need to use actors here to avoid blocking while waiting for getPageSizeAndLinkCount to return.
    actor { caller ! (url, PageLoader.getPageSizeAndLinkCount(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size and link count for " + url + ": " + size)
    }
  }
}

// There seems to be some speed up after the first fetch.
println("Warming up...")
timeMethod { getPageSizeAndLinkCountConcurrently }

println("Sequential run:")
timeMethod { getPageSizeAndLinkCountSequentially }

println("Concurrent run")
timeMethod { getPageSizeAndLinkCountConcurrently }
