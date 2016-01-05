use std::io::{self, BufRead};
use std::str::FromStr;

fn read_line<F>() -> Result<F, F::Err> where F: FromStr {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input.trim().parse()
}

const FACTORIAL: &'static[usize] =
  &[1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

fn digit_factorial(number: usize) -> usize {
  let mut sum = 0;
  let mut n = number;

  while n > 0 {
    sum += FACTORIAL[n % 10];
    n /= 10;
  }

  sum
}

fn main() {
  let limit = read_line::<usize>().unwrap_or(0);

  let sum = (10 .. limit).filter(|&k| digit_factorial(k) % k == 0)
                         .fold(0, |sum, k| sum + k);

  println!("{}", sum);
}
