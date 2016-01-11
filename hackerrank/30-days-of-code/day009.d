import std.conv: to;
import std.stdio: readln, writeln;
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

  writeln(gcd(line[0].to!int, line[1].to!int));
}
