class DnaTranscriber {
  public function toRna(dna: String) {
    var rna = "";
    for (i in 0 ... dna.length) {
      rna += switch dna.charAt(i) {
        case "C": "G";
        case "G": "C";
        case "A": "U";
        case "T": "A";
        case _: throw "Invalid dna string.";
      };
    }
    return rna;
  }
}
