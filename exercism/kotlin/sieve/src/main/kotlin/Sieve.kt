object Sieve {
  fun primesUpTo(limit: Int): List<Int> {
    val prime_candidate = Array(limit + 1, { true })
    return (2 .. limit).filter {
      if (prime_candidate[it]) {
        for (k in it .. limit / it) {
          prime_candidate[k * it] = false
        }
      }
      prime_candidate[it]
    }
  }
}
