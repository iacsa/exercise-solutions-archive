import java.util.Random

private object NameGenerator {
  val random: Random = Random()
  val used: MutableSet<String> = hashSetOf()

  private fun random_digit(): Char {
    return '0' + random.nextInt(10)
  }
  private fun random_letter(): Char {
    return 'A' + random.nextInt(26)
  }

  private fun next_unchecked(): String {
    return listOf(random_letter(),
                  random_letter(),
                  random_digit(),
                  random_digit(),
                  random_digit()).joinToString(separator="")
  }

  fun next(): String {
    var result = next_unchecked()
    while (used.contains(result)) {
      result = next_unchecked()
    }
    used.add(result)
    return result
  }
}

class Robot {
  var name: String = NameGenerator.next()
    get

  fun reset() {
    this.name = NameGenerator.next()
  }
}
