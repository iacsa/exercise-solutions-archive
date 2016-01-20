import std.stdio: readln, writeln;
import std.regex: splitter, regex;
import std.algorithm: filter;
import std.array: array;

void main(string[] args) {
  auto words = readln().splitter(regex("[^[a-zA-Z]]+"))
                       .filter!(w => w.length > 0).array;

  writeln(words.length);

  foreach (word; words) {
    writeln(word);
  }
}
