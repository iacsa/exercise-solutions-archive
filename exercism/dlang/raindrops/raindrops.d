import std.stdio;

import std.conv : to;


string convert(int number) {
  string result;
  
  if (number % 3 == 0) {
    result ~= "Pling";
  }
  if (number % 5 == 0) {
    result ~= "Plang";
  }
  if (number % 7 == 0) {
    result ~= "Plong";
  }

  if (result == "") {
    return number.to!string;
  } else {
    return result;
  }
}


void main() {
    assert(convert(1) == "1");
    assert(convert(3) == "Pling");
    assert(convert(5) == "Plang");
    assert(convert(7) == "Plong");
    assert(convert(6) == "Pling");
    assert(convert(9) == "Pling");
    assert(convert(10) == "Plang");
    assert(convert(14) == "Plong");
    assert(convert(15) == "PlingPlang");
    assert(convert(21) == "PlingPlong");
    assert(convert(25) == "Plang");
    assert(convert(35) == "PlangPlong");
    assert(convert(49) == "Plong");
    assert(convert(52) == "52");
    assert(convert(105) == "PlingPlangPlong");

    writeln("All tests passed");
}
