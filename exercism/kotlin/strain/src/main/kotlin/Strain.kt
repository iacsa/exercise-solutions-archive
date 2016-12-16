object Strain {
  fun<T> keep(items: Iterable<T>, p: (T) -> Boolean): List<T> {

    val result: MutableList<T> = arrayListOf()

    for (item in items) {
      if (p(item)) result += item
    }

    return result
  }

  fun<T> discard(items: Iterable<T>, p: (T) -> Boolean): List<T> =
    keep(items, { !p(it) })
}
