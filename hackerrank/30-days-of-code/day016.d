import std.stdio: readln, writef;
import std.conv: to;
import std.array: split, array;
import std.algorithm: map, sort;
import std.math: abs;

void main(string[] args) {
  readln(); // Throw away unused line of values

  auto values = readln().split.map!(t => t.to!int).array;
  values.sort();

  auto min = (values[1] - values[0]).abs;

  foreach (i; 2 .. values.length) {
    auto d = (values[i] - values[i - 1]).abs;
    if (d < min) { min = d; }
  }

  foreach (i; 1 .. values.length) {
    auto d = (values[i] - values[i - 1]).abs;
    if (d == min) { writef("%d %d ", values[i - 1], values[i]); }
  }
  writef("\n");
}
