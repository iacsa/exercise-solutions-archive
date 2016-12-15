object Raindrops {
  private val sounds = listOf(3 to "Pling", 5 to "Plang", 7 to "Plong")
  fun convert(n: Int): String =
    try {
      sounds.filter { n % it.first == 0 }
                   .map { it.second }
                   .reduce { a, b -> a + b }
    } catch (e: UnsupportedOperationException) {
      n.toString()
    }
}
