import std.stdio: writeln, readln;
import std.conv: to;
import std.string: strip, rightJustify;

void main(string[] args) {
  auto n = readln.strip.to!int;

  foreach (i; 0 .. n) {
    writeln("".rightJustify(i + 1, '#').rightJustify(n));
  }
}
