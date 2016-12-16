object PigLatin {
  fun translate(text: String): String =
    text.split(' ').map { translateWord(it) }.joinToString(" ")

  private fun translateWord(word: String): String {
    val index = when {
      word.matches(Regex("([bcdfghlklmnpqrstvwxyz]qu|thr|sch).*")) -> 3
      word.matches(Regex("(ch|qu|th).*")) -> 2
      word.matches(Regex("(ye|[bcdfghlklmnpqrstvwz]|[xy][aeiou]).*")) -> 1
      else -> 0
    }
    return word.substring(index, word.length) + word.substring(0, index) + "ay"
  }
} 
