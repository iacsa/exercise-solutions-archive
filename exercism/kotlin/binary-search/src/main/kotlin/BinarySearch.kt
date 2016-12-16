object BinarySearch {
  fun search(xs: List<Int>, x: Int): Int {

    // This makes the search unusable, but is required by the specification T.T
    require((1 until xs.size).all { xs[it - 1] <= xs[it] }) { "Given unsorted array." }

    var low = 0
    var high = xs.size - 1
    while (low <= high) {
      var mid = (high + low) / 2
      when {
        xs[mid] > x -> high = mid - 1
        xs[mid] < x -> low = mid + 1
        xs[mid] == x -> return mid
      }
    }
    return -1
  }
}
