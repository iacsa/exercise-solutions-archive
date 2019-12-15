module hamming;

import std.exception : assertThrown;
import std.range : zip;
import std.algorithm.searching : count;


ulong distance(string s1, string s2) {
  if (s1.length != s2.length) {
    throw new Exception("Given strings of unequal length.");
  }
  return zip(s1, s2).count!(a => a[0] != a[1]);
}


unittest {
  const int allTestsEnabled = 1;

  assert(distance("A", "A") == 0);
  static if (allTestsEnabled) {
    assert(distance("A", "G") == 1);
    assert(distance("AG", "CT") == 2);
    assert(distance("AT", "CT") == 1);
    assert(distance("GGACG", "GGTCG") == 1);
    assertThrown(distance("AAAG", "AAA"));
    assertThrown(distance("AAA", "AAAG"));
    assert(distance("GATACA", "GCATAA") == 4);
    assert(distance("GGACGGATTCTG", "AGGACGGATTCT") == 9);
  }
}


void main () {
}
