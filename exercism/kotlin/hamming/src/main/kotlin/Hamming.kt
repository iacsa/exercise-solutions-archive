object Hamming {
  fun compute(s1: String, s2: String): Int {
    if (s1.length != s2.length) {
      throw IllegalArgumentException("Arguments must be of the same length.")
    }

    return s1.indices.count { s1[it] != s2[it] }
  }
}
