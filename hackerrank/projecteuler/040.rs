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


fn ten_pow(n: u64) -> u64 { 10u64.pow(n as u32) }

fn digit(i: u64, exp: u64) -> u64 {
  if i >= 9 * ten_pow(exp) * (exp + 1) {
    digit(i - 9 * ten_pow(exp) * (exp + 1), exp + 1)
  } else {
    let n = i / (exp + 1) + ten_pow(exp);
    let d = i % (exp + 1);
    (n / ten_pow(exp - d)) % 10
  }
}


fn main() {
  let input_count = read_one::<u64>();

  for _ in 0 .. input_count {

    let input = read_multiple::<u64>(" ");
    let digits = input.iter().map(|i| digit(i - 1, 0));
    let product = digits.fold(1, |acc, d_i| acc * d_i);

    println!("{}", product);
  }
}
