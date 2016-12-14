object Pangrams {
  fun isPangram(text: String): Boolean {
    return ('a' .. 'z').all { text.contains(it, ignoreCase = true) }
  }
}
