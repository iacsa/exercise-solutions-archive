import java.util.NoSuchElementException

class Change(val coins: Set<Int>) {

  val best: MutableMap<Int, List<Int>?> = mutableMapOf(0 to emptyList())

  fun memo(amount: Int): List<Int>? {
    if (amount < 0) return null
    if (best.containsKey(amount)) return best[amount]

    val result = try {
      coins.map { memo(amount - it)?.plus(it) }
           .filterNotNull()
           .sortedBy { it.size }
           .first()
    } catch (e: NoSuchElementException) {
      null
    }
    
    best[amount] = result
    return result
  }

  fun issue(amount: Int): List<Int> {
    return memo(amount)?.sorted() ?: throw IllegalArgumentException()
  }
}
