object Isogram {
  fun isIsogram(word: String): Boolean {
    val charCount: MutableMap<Char, Int> = hashMapOf()
    word.toLowerCase()
        .filter { it.isLetter() }
        .forEach { charCount[it] = (charCount[it] ?: 0) + 1 }

    return charCount.all { it.value == 1 }
  }
}
