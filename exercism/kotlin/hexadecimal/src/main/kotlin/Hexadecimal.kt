object Hexadecimal {
  fun toDecimal(hex: String): Int {
    return hex.fold(0, { acc, digit ->
      16 * acc + when (digit) {
        in '0' .. '9' -> (digit - '0').toInt()
        in 'a' .. 'f' -> 10 + (digit - 'a').toInt()
        in 'A' .. 'F' -> 10 + (digit - 'A').toInt()
        else -> return 0
      }
    })
  }
}
