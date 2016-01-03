use std::io::{self, BufRead};
use std::str::FromStr;

fn read_line<F>() -> Result<F, F::Err> where F: FromStr {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input.trim().parse()
}

fn main() {
  let n = read_line::<i64>().unwrap_or(0);

  if n % 2 == 1 || (6 <= n && n <= 20) {
    println!("Weird");
  } else {
    println!("Not Weird");
  }
}
