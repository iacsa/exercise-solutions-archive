object Flattener {
  fun flatten(items: List<Any?>): List<Any> {
    return items.flatMap {
      when(it) {
        is List<*> -> flatten(it)
        null -> emptyList()
        else -> listOf(it)
      }
    }
  }
}
