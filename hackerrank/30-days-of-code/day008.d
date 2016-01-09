import std.conv: to;
import std.stdio: readln, lines, stdin, writefln, writeln;
import std.string: strip;

void main(string[] args) {
  auto input_count = readln().strip.to!int;
  string[string] phone_book;

  foreach (_; 0 .. input_count) {
    auto name = readln().strip;
    auto number = readln().strip;

    phone_book[name] = number;
  }

  foreach (string line; stdin.lines) {
    auto name = line.strip;
    auto number = name in phone_book;

    if (number is null) {
      writeln("Not found");
    } else {
      writefln("%s=%s", name, *number);
    }
  }
}
