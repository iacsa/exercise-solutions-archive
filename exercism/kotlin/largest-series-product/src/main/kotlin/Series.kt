class Series(series: String) {

  val series: List<Long>
  
  init {
    if (!series.all { it.isDigit() })
      throw IllegalArgumentException("Non-digit characters in series.")
    this.series = series.map { (it - '0').toLong() }
   }

  fun getLargestProduct(span: Int): Long {
    if (span > series.size)
      throw IllegalArgumentException("Span exceeds series length.")
    if (span < 0)
      throw IllegalArgumentException("Span is negative.")
    if (span == 0)
      return 1

    return (0 .. series.size - span).map {
      series.subList(it, it + span).reduce({ a, b -> a * b })
    }.max()!!
  }
}
