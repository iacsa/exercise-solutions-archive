object WordCount {
  fun phrase(text: String): Map<String, Int> {

    val counts: MutableMap<String, Int> = hashMapOf()

    text.toLowerCase()
        .split(Regex("""[^a-z0-9']"""))
        .filter { !it.isBlank() }
        .forEach { counts[it] = (counts[it] ?: 0) + 1 }
    
    return counts
  }
}
