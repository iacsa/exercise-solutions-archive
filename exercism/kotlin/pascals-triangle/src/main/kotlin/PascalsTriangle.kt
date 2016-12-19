object PascalsTriangle {

  fun computeTriangle(n: Int): List<List<Int>> {
    if (n < 0) throw IllegalArgumentException("Non-negative argument required.")
    if (n == 0) return listOf()

    val result = mutableListOf(listOf(1))
    
    for (i in 1 until n) {
      result += (0 .. i).map {
        result.last().getOrElse(it - 1, { 0 }) + result.last().getOrElse(it, { 0 })
      }
    }

    return result
  }
}
