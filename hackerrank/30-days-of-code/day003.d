import std.stdio: writeln, readln;
import std.conv: to;
import std.string: strip;

void main(string[] args) {
  auto n = readln.strip.to!int;

  if (n % 2 == 1 || (6 <= n && n <= 20)) {
    writeln("Weird");
  } else {
    writeln("Not Weird");
  }
}
