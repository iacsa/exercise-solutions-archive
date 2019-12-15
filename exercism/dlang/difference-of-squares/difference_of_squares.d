module difference_of_squares;

import std.stdio;
import std.typecons;


alias Result = Tuple!(int, "squareOfSum",
                      int, "sumOfSquares",
                      int, "difference");

Result squares(int n) {
  Result result;
  result.squareOfSum = (n + 1) * (n + 1) * n * n / 4;
  result.sumOfSquares = (2 * n + 1) * (n + 1) * n / 6;
  result.difference = result.squareOfSum - result.sumOfSquares;
  return result;
}


void main() {
    assert(squares(5).squareOfSum == 225);
    assert(squares(10).squareOfSum == 3_025);
    assert(squares(100).squareOfSum == 25_502_500);

    assert(squares(5).sumOfSquares == 55);
    assert(squares(10).sumOfSquares == 385);
    assert(squares(100).sumOfSquares == 338_350);

    assert(squares(0).difference == 0);
    assert(squares(5).difference == 170);
    assert(squares(10).difference == 2_640);
    assert(squares(100).difference == 25_164_150);

    writeln("All tests passed");
}
