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


fn triangle_number(n: u64) -> u64 {
  n * (n + 1) / 2
}

fn triangle_root(t: u64) -> Option<u64> {
  let exact = ((8.0 * (t as f64) + 1.0).sqrt() - 1.0) / 2.0;
  if triangle_number(exact.round() as u64) == t {
    Some(exact.round() as u64)
  } else {
    None
  }
}


fn main() {
  let input_count = read_one::<u64>();

  for _ in 0 .. input_count {
    let t = read_one::<u64>();

    if let Some(n) = triangle_root(t) {
      println!("{}", n);
    } else {
      println!("{}", -1);
    }
  }
}
