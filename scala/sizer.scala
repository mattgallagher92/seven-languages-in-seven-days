import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageSizeAndLinks(url: String) = {
    val sourceString = Source.fromURL(url).mkString
    val linkExtractionRegex = "<a[^>]+?href=\"(.+?)\"".r
    val links =
      linkExtractionRegex
        .findAllIn(sourceString)
        .matchData
        .map(_.group(1))
        .toArray
    (sourceString.length, links)
  }
}

// Most sites don't work!
// Some sites fail due to rate limiting; some sites seem to have 0 links, maybe because of SPAs 🤷
val urls = List(
  "https://example.com",
  "https://example.org"
)

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("\nMethod took " + (end - start)/1000000000.0 + " seconds.")
}

def createMessage(url: String, linkCount: Int, totalSize: Int) = {
  s"$url has $linkCount links. The total size of $url and its children is $totalSize"
}

def getPageSizeAndLinksSequentially() = {
  urls
    .map(url => {
      val (size, links) = PageLoader.getPageSizeAndLinks(url)

      var totalSize = size
      links.foreach(link => {
        val (pageSize, _) = PageLoader.getPageSizeAndLinks(link)
        totalSize += pageSize
      })

      createMessage(url, links.length, totalSize)
    })
    .mkString("\n")
}

def getPageSizeAndLinksConcurrently() = {
  // `self` is apparently an implicit actor associated with the current execution context.
  val outerActor = self

  urls.foreach(url => {
    // Need to use actors here to avoid blocking while waiting for getPageSizeAndLinks to return.
    actor {
      val (size, links) = PageLoader.getPageSizeAndLinks(url)

      val innerActor = self
      links.foreach(link => {
        actor {
          val (pageSize, _) = PageLoader.getPageSizeAndLinks(link)
          innerActor ! pageSize
        }
      })

      var totalSize = size
      for(i <- 1 to links.size) {
        receive {
          case (pageSize: Int) => totalSize += pageSize
        }
      }

      outerActor ! (url, links.length, totalSize)
    }
  })

  var msg = ""
  for(i <- 1 to urls.size) {
    // Using receive rather than react ensures that the function doesn't exit before the messages have returned.
    receive {
      case (url: String, linkCount: Int, totalSize: Int) =>
        msg += createMessage(url, linkCount, totalSize) + "\n"
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
