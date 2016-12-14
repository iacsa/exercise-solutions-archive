private fun sortString (s: String): String {
  val letters = s.toCharArray()
  letters.sort()
  return letters.joinToString()
}

class Anagram(word: String) {
  val original = word.toLowerCase()
  val normalized = sortString(original)

  fun match(others: List<String>): List<String> {
    return others.filter {
      val word = it.toLowerCase()
      word != original && sortString(word) == normalized
    }
  }
}
