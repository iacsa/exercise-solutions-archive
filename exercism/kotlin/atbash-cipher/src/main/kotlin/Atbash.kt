object Atbash {

  fun encode(text: String): String {
    return text.filter { it.isLetterOrDigit() }
               .map { mirror(it.toLowerCase()) }
               .intersperse(' ', 5)
  }

  fun decode(cipher: String): String =
    cipher.filterNot { it.isWhitespace() }
          .map { mirror(it) }
          .joinToString("")

  private fun mirror(c: Char): Char =
    if (c in 'a' .. 'z') (219 - c.toInt()).toChar() else c
}

fun Iterable<Char>.intersperse(c: Char, span: Int): String {
  val iter = this.iterator()
  return object : Iterable<Char> {
    override operator fun iterator(): Iterator<Char> =
      object : Iterator<Char> {
        val source = iter
        var count = 0
        override fun hasNext(): Boolean = source.hasNext()
        override fun next(): Char = if (count++ % (span + 1) == span) c else source.next()
      }
  }.joinToString("")
}
