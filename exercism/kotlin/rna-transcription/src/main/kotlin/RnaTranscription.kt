object RnaTranscription {
  fun ofDna(dna: String): String {
    return dna.map {
      when (it) {
        'G' -> 'C'
        'C' -> 'G'
        'A' -> 'U'
        'T' -> 'A'
        else -> throw IllegalArgumentException("Illegal characters in DNA sequence")
      }
    }.joinToString(separator = "")
  }
}
