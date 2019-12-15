class Hamming {

  public function compute(s1: String, s2: String) {
    if (s1.length != s2.length)
      throw "DNA strands must be of equal length.";

    var diffCount = 0;
    for (i in 0 ... s1.length) {
      if (s1.charAt(i) != s2.charAt(i))
        diffCount++;
    }

    return diffCount;
  }
}
