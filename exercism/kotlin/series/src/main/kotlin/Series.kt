object Series {

  fun slices(span: Int, items: String): List<List<Int>> {
    if (span <= 0)
      return listOf()

    return (0 .. items.length - span).map {
      items.substring(it, it + span).map{ (it - '0').toInt() }
    }
  }
}
