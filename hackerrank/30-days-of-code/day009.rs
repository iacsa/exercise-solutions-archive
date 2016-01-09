use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn gcd(a: u64, b: u64) -> u64 {
  if a == 0 {
    b
  } else {
    gcd(b % a, a)
  }
}

fn main() {
  let input = read_multiple::<u64>(" ");
  let (a, b) = (input[0], input[1]);

  println!("{}", gcd(a, b));
}
