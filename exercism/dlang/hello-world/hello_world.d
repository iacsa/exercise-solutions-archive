module helloworld_test;

import std.stdio;
import std.format;


string hello(string name = "World") {
  return format("Hello, %s!", name);
}


void main() {
    assert(hello() == "Hello, World!");
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
    assert(hello("") == "Hello, !");

    writeln("All tests passed.");
}
