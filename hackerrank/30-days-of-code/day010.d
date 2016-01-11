import std.conv: to;
import std.stdio: readln, writefln;
import std.string: strip;

void main(string[] args) {

  auto input_count = readln.strip.to!int;

  foreach (_; 0 .. input_count) {
    auto n = readln().strip.to!ulong;

    writefln("%b", n);
  }
}
