class Luhn(val number: Long) {

  val addends = mutableListOf<Int>()

  val checkDigit: Int
    get() = addends.last()

  val checksum: Int
    get() = addends.sum()

  val isValid: Boolean
    get() = checksum % 10 == 0

  val create: Long
    get() = 10 * number + (10 - Luhn(10 * number).checksum % 10) % 10

  init {
    var x = number
    var i = 0
    if (x == 0L) addends += 0
    while (x > 0L) {
      var next = (x % 10).toInt()
      if (i++ % 2 > 0) next *= 2
      if (next > 9) next -= 9
      addends += next
      x /= 10
    }
    addends.reverse()
  }
}
