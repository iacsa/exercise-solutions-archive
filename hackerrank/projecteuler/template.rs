use std::str::FromStr;
use std::io::{stdin, Read};


fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}

fn read_rest<F>() -> Vec<F> where F: FromStr {
  let mut input = String::new();
  stdin().read_to_string(&mut input).expect("Could not read stdin!");
  input.lines().map(|s| s.to_string().parse().ok().unwrap()).collect()
}

fn read_rest_multiple<F>(sep: &str) -> Vec<Vec<F>> where F: FromStr {
  let mut input = String::new();
  stdin().read_to_string(&mut input).expect("Could not read stdin!");
  input.lines().map(|s| s.split(sep).map(|token| token.parse().ok().unwrap()).collect()).collect()
}


fn main() {
  let input_count = read_one::<u64>();

  for _ in 0 .. input_count {
    let n = read_one::<u64>();
  }
}
