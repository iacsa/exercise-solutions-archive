class Change(val s: Set<Int>) {

  fun issue(amount: Int): List<Int> {
    return give(amount, s.toSortedSet().reversed())
  }

  private fun give(amount: Int, coins: List<Int>): List<Int> {
    if (amount == 0) return emptyList()
    if (coins.isEmpty() || amount < 0) throw IllegalArgumentException()

    if (coins.size == 1 || coins.first() <= amount && coins.first() >= 2 * coins[1]) {
      return give(amount - coins.first(), coins) + coins.first()
    }

    try {
      val l1 = give(amount - coins.first(), coins)
      try {
        val l2 = give(amount, coins.drop(1))
        return if (l1.size < l2.size) l1 + coins.first() else l2
      } catch (e: IllegalArgumentException) {
        return l1 + coins.first()
      }
    } catch (e: IllegalArgumentException) {
      return give(amount, coins.drop(1))
    }
  }
}
