use std::io::{self, BufRead};

fn main() {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  let n: usize = input.trim().parse().unwrap_or(0);

  for i in 1 .. n + 1 {
    println!("{0:>1$}{0:#>2$}", "", n - i, i);
  }
}
