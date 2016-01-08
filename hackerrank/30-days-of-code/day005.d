import std.stdio: writefln, writef, readln;
import std.conv: to;
import std.string: strip;
import std.array: split;

void main(string[] args) {
  auto input_count = readln.strip.to!int;

  foreach (loop; 0 .. input_count) {
    auto input = readln.strip.split;
    auto a = input[0].to!int;
    auto b = input[1].to!int;
    auto n = input[2].to!int;

    foreach (i; 0 .. n) {
      writef("%d ", (a - b + (b << i + 1)));
    }
    writefln("");
  }
}
