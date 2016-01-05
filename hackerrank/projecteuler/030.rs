use std::io::{self, BufRead};
use std::str::FromStr;

fn read_line<F>() -> Result<F, F::Err> where F: FromStr {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input.trim().parse()
}

fn is_writable(number: u32, power: u32) -> bool {
  let mut sum = 0;
  let mut n = number;

  while n > 0 {
    sum += (n % 10).pow(power);
    n /= 10;
  }

  sum == number
}

fn main() {
  let power = read_line::<u32>().unwrap_or(0);

  let sum = (10 .. 10u32.pow(6)).filter(|&k| is_writable(k, power))
                                .fold(0, |sum, k| sum + k);

  println!("{}", sum);
}
