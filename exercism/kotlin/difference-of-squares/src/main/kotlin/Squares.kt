class Squares(val n: Int) {
  
  fun squareOfSum(): Int = (n + 1) * (n + 1) * n * n / 4

  fun sumOfSquares(): Int = (2 * n + 1) * (n + 1) * n / 6

  fun difference(): Int = squareOfSum() - sumOfSquares()
}
