import java.lang.Math

fun Int.log(): Double = Math.log(this.toDouble())
fun Double.ceil(): Int = Math.ceil(this).toInt()

object Prime {
  
  // Find the nth prime number using the sieve of Eratosthenes
  fun nth(n: Int): Int {
    require(n > 0) { "n must be positive." }

    // Conservative upper bound makes sure we always hit the target
    val limit = 13 + (3.8 * n * n.log()).ceil()

    var found = 0
    val prime_candidate = Array(limit + 1, { true })
    (2 .. limit).forEach {
      if (prime_candidate[it]) {
        for (k in it .. limit / it) {
          prime_candidate[k * it] = false
        }
        if (found++ + 1 == n)
          return it
      }
    }

    // We can never reach this, but need to make the compiler happy
    throw IllegalStateException()
  }
}
