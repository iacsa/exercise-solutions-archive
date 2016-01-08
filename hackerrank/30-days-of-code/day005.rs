use std::io::{self, BufRead};
use std::str::FromStr;

fn read_line() -> String {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}

fn main() {
  let input_count = read_one::<u32>();

  for _ in 0 .. input_count {
    let input = read_multiple::<i32>(" ");
    let (a, b, n) = (input[0], input[1], input[2]);

    let sequence = (0 .. n).map(|i| (a - b + (b << i + 1)));
    let result = sequence.map(|i| i.to_string()).collect::<Vec<_>>().join(" ");
    println!("{}", result);
  }
}
