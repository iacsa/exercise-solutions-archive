object Acronym {

  // We want to include in the abbreviation:
  // 1. Any capital letter not immediately preceded by another capital letter
  // 2. Any lowercase letter not immediately preceded by any other letter
  fun generate(phrase: String): String {
    return (" " + phrase).zip(phrase).filter {
      it.second.isUpperCase() && !it.first.isUpperCase() ||
      it.second.isLetter() && !it.first.isLetter()
    }.map { it.second.toUpperCase() }.joinToString("")
  }
}
