import std.stdio: readln, writefln;
import std.math: lround;
import std.conv: to;
import std.string: strip;

void main(string[] args) {
  // Doesn't hurt to read all as reals
  auto original_price = readln().strip().to!real();
  auto tip_ratio = readln().strip().to!real() / 100;
  auto tax_ratio = readln().strip().to!real() / 100;

  auto full_price = original_price * (1 + tip_ratio + tax_ratio);
  
  auto rounded_price = full_price.lround().to!int();
  
  writefln("The final price of the meal is $%d.", rounded_price);
}
