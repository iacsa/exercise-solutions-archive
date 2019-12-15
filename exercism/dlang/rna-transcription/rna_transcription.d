module rna_transcription;

import std.exception : assertThrown;
import std.stdio;
import std.string : translate;
import std.algorithm.searching : all;
import std.algorithm.comparison : among;


string dnaComplement(string from) {
  if (from.all!(a => a.among!('A', 'T', 'G', 'C'))) {
    return from.translate(['A' : 'U', 'T' : 'A', 'G' : 'C', 'C' : 'G']);
  } else {
    throw new Exception("Illegal characters in dna sequence.");
  }
}


void main() {
    assert(dnaComplement("C") == "G");
    assert(dnaComplement("G") == "C");
    assert(dnaComplement("T") == "A");
    assert(dnaComplement("A") == "U");

    assert(dnaComplement("ACGTGGTCTTAA") == "UGCACCAGAAUU");

    assertThrown(dnaComplement("U"));
    assertThrown(dnaComplement("XXX"));
    assertThrown(dnaComplement("ACGTXXXCTTAA"));

    writeln("All tests passed");
}
