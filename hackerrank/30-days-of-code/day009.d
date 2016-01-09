import std.conv: to;
import std.stdio: readln, lines, stdin, writefln, writeln;
import std.string: strip;
import std.array: split;

int gcd(int a, int b) {
  if (a == 0) {
    return b;
  } else {
    return gcd(b % a, a);
  }
}

void main(string[] args) {

  auto line = readln().split;

  writefln("%d", gcd(line[0].to!int, line[1].to!int));
}
