use std::io::{self, BufRead};
use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn pentagonal_number(n: u64) -> u64 {
  n * (3 * n - 1) / 2
}

fn is_pentagonal(n: u64) -> bool {
  let exact = ((24.0 * (n as f64) + 1.0).sqrt() + 1.0) / 6.0;
  pentagonal_number(exact.round() as u64) == n
}


fn main() {
  let input = read_multiple::<u64>(" ");
  let (limit, k) = (input[0], input[1]);

  for n in k + 1 .. limit + 1 {
    let p_n = pentagonal_number(n);
    let p_k = pentagonal_number(n - k);

    if is_pentagonal(p_n + p_k) || is_pentagonal(p_n - p_k) {
      println!("{}", p_n);
    }
  }
}
