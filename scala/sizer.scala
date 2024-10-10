import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageSizeAndLinks(url: String) = {
    val sourceString = Source.fromURL(url).mkString
    val linkCount = "</a>".r.findAllIn(sourceString).length
    val linkExtractionRegex = "<a[^>]+?href=\"(.+?)\"".r
    val links = linkExtractionRegex.findAllIn(sourceString).matchData.map(_.group(1)).toArray
    (sourceString.length, links)
  }
}

// Other common sites aren't working, I suspect due to HTTPS redirects.
val urls = List("http://www.google.co.uk/", "http://www.google.com/", "http://www.google.ca/")

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("\nMethod took " + (end - start)/1000000000.0 + " seconds.")
}

def createMessage(url: String, size: Int, links: Array[String]) = {
  val linkLines = links.mkString("\n    ")
  s"""
  Size of $url: $size
  Links in $url:
    $linkLines"""
}

def getPageSizeAndLinksSequentially() = {
  urls
    .map(url => {
      val (size, links) = PageLoader.getPageSizeAndLinks(url)
      createMessage(url, size, links)
    })
    .mkString("\n")
}

def getPageSizeAndLinksConcurrently() = {
  // `self` is apparently an implicit actor associated with the current execution context.
  val caller = self

  for(url <- urls) {
    // Need to use actors here to avoid blocking while waiting for getPageSizeAndLinks to return.
    actor { caller ! (url, PageLoader.getPageSizeAndLinks(url)) }
  }

  var msg = ""
  for(i <- 1 to urls.size) {
    receive {
      case (url: String, (size: Int, links: Array[String])) =>
        msg += createMessage(url, size, links) + "\n"
    }
  }
  msg
}

// There seems to be some speed up after the first fetch.
println("Warming up...")
getPageSizeAndLinksConcurrently

println("\nSequential run:")
timeMethod { () => println(getPageSizeAndLinksSequentially) }

println("\nConcurrent run:")
timeMethod { () => println(getPageSizeAndLinksConcurrently) }
