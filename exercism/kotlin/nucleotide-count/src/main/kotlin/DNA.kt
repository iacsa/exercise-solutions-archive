private val legalNucleotides = "ACGT"

class DNA(val dna: String) {

  init {
    if (!dna.all { it in legalNucleotides }) {
      throw IllegalArgumentException("Illegal character in DNA sequence")
    }
  }

  fun count(nucleotide: Char): Int =
    if (nucleotide in legalNucleotides) {
      dna.count { it == nucleotide }
    } else {
      throw IllegalArgumentException("Illegal nucleotide character.")
    }

  val nucleotideCounts: Map<Char, Int>
    get() = legalNucleotides.map { it to count(it) }.toMap()

}
