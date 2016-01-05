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


fn is_prime(n: u64) -> bool {
  n > 1 && !(2 .. (n as f64).sqrt().floor() as u64 + 1).any(|d| n % d == 0)
}


fn main() {
  let input_count = read_one::<u64>();

  for _ in 0 .. input_count {

    let input = read_one::<u64>();
    let mut count = 0;
    let mut i = 1;

    while 2 * i * i < input {

      if is_prime(input - 2 * i * i) {
        count += 1;
      }

      i += 1;
    }
    println!("{}", count);
  }
}
