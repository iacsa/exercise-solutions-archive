object Bob {
  private fun isUpperCase(query: String): Boolean {
    return query.toUpperCase() == query && query.toLowerCase() != query
  }

  fun hey(query: String): String {
    return when {
      query.isBlank() -> "Fine. Be that way!"
      isUpperCase(query) -> "Whoa, chill out!"
      query.endsWith("?") -> "Sure."
      else -> "Whatever."
    }
  }
}
