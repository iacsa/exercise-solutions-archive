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


fn triangle_number(n: u64) -> u64 { n * (n + 1) / 2 }
fn pentagonal_number(n: u64) -> u64 { n * (3 * n - 1) / 2 }
fn hexagonal_number(n: u64) -> u64 { n * (2 * n - 1) }

fn is_triangle(n: u64) -> bool {
  let exact = ((8.0 * (n as f64) + 1.0).sqrt() - 1.0) / 2.0;
  triangle_number(exact.round() as u64) == n
}
fn is_pentagonal(n: u64) -> bool {
  let exact = ((24.0 * (n as f64) + 1.0).sqrt() + 1.0) / 6.0;
  pentagonal_number(exact.round() as u64) == n
}


fn main() {
  let input = read_multiple::<u64>(" ");
  let (n, a, b) = (input[0], input[1], input[2]);

  let (f, test) = if (a, b) == (3, 5) {
    (pentagonal_number as fn(u64) -> u64, is_triangle as fn(u64) -> bool)
  } else if (a, b) == (5, 6) {
    (hexagonal_number as fn(u64) -> u64, is_pentagonal as fn(u64) -> bool)
  } else {
    panic!("Unsupported parameters!");
  };

  let mut i = 1;
  let mut b_i = f(i);

  while b_i < n {
    if test(b_i) {
      println!("{}", b_i);
    }
    i += 1;
    b_i = f(i);
  }
}
