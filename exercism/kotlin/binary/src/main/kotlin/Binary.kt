object Binary {
  fun toDecimal(binary: String): Int =
    binary.fold(0, { acc, digit ->
      when (digit) {
        '0' -> 2 * acc
        '1' -> 2 * acc + 1
        else -> return 0
      }
    })
}
