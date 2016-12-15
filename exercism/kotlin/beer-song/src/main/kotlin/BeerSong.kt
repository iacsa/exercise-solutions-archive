object BeerSong {

  private fun bottles(n: Int) =
    "%s bottle%s of beer".format(if (n == 0) "no more" else n,
                                 if (n == 1) "" else "s")

  private fun action(n: Int) =
    if (n == 0) {
      "Go to the store and buy some more"
    } else {
      "Take %s down and pass it around".format(if (n == 1) "it" else "one")
    }

  fun verse(n: Int): String {
    if (!(n in 0 .. 99)) throw IllegalArgumentException("Arguments must be in range 0 to 99.")

    return "${bottles(n).capitalize()} on the wall, ${bottles(n)}.\n" +
           "${action(n)}, ${bottles((n + 99) % 100)} on the wall.\n"
  }

  fun verses(high: Int, low: Int): String {
    if (low > high) throw IllegalArgumentException("'low' must not be greater than 'high'.")

    return (high downTo low).map { verse(it) }.joinToString("\n")
  }

  val lyrics: String
    get() = verses(99, 0)
}
