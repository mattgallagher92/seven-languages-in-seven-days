import scala.io._
import scala.actors._
import Actor._

object PageLoader {
   def getPageSize(url : String) = Source.fromURL(url).mkString.length
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

def getPageSizeSequentially() = {
  for(url <- urls) {
    println("Size for " + url + ": " + PageLoader.getPageSize(url))
  }
}

def getPageSizeConcurrently() = {
  // `self` is apparently an implicit actor associated with the current execution context.
  val caller = self

  for(url <- urls) {
    // Need to use actors here to avoid blocking while waiting for getPageSize to return.
    actor { caller ! (url, PageLoader.getPageSize(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size for " + url + ": " + size)
    }
  }
}

// There seems to be some speed up after the first fetch.
println("Warming up...")
timeMethod { getPageSizeConcurrently }

println("Sequential run:")
timeMethod { getPageSizeSequentially }

println("Concurrent run")
timeMethod { getPageSizeConcurrently }
