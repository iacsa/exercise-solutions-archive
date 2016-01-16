use std::str::FromStr;
use std::io::stdin;

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

fn main() {
  let input_length = read_one::<usize>();

  let mut input = read_multiple::<i64>(" ");
  input.sort();

  let mut min = (input[1] - input[0]).abs();

  for i in 2 .. input_length {
    let d = (input[i] - input[i - 1]).abs();
    if d < min { min = d; }
  }

  for i in 1 .. input_length {
    let d = (input[i] - input[i - 1]).abs();
    if d == min { print!("{} {} ", input[i - 1], input[i]); }
  }
  println!("");
}
