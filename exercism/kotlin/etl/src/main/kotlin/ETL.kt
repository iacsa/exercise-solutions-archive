object ETL {
  fun transform(input: Map<Int, List<String>>): Map<String, Int> {
    return input.flatMap { it.value.map { word -> word.toLowerCase() to it.key } }.toMap()
  }
}
