object Accumulate {
  fun <T, U> accumulate(list: List<T>, f: (T) -> U):  Iterable<U> {
    var result: List<U> = emptyList()

    for (item in list) {
      result += f(item)
    }

    return result
  }
}
