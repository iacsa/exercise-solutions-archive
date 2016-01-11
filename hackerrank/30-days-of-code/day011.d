import std.conv: to;
import std.stdio: readln, writeln;
import std.array: split, array;
import std.algorithm: map;

void main(string[] args) {

  int[6][6] matrix;

  foreach (i; 0 .. 6) {
    matrix[i] = readln().split.map!(n => n.to!int).array;
  }


  int max = -100;

  foreach (row; 1 .. 5) {
    foreach (col; 1 .. 5) {
      int sum = matrix[row][col];
      foreach (j; col - 1 .. col + 2) {
        sum += matrix[row - 1][j] + matrix[row + 1][j];
      }
      if (sum > max) { max = sum; }
    }
  }


  writeln(max);
}
