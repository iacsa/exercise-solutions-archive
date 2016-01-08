import std.array: split;
import std.stdio: readln, writeln;
import std.algorithm: reverse, reduce;


void main(string[] args) {

  // Throw away first line of input, we don't need the array length
  readln();

  auto line = readln().split;
  reverse(line);

  writeln(line.reduce!((a, b) => a ~ " " ~ b));
}
