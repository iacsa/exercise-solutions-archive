use std::io::{self, BufRead};

fn read_int() -> i64 {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input.trim().parse().unwrap_or(0)
}

fn factors(n: i64) -> Box<Iterator<Item = i64>> {
  Box::new((1 .. n).filter(move |d| n % d == 0))
}

// Euclid's formula gives
// a = k (m^2 - n^2), b = 2 k m n, c = k (m^2 + n^2)
// From sum = a + b +c there follows:
// sum = 2 k m (m + n)

fn main() {
  let count = read_int();
  for _ in 0 .. count {
    let sum = read_int();
    let mut max_product = -1;

    if sum % 2 == 0 { // only even
      for m in factors(sum / 2) {
        for k in factors(sum / (2 * m)) {
          let n = sum / (2 * k * m) - m;
          if n <= 0 { continue; }

          let a = k * (m * m - n * n);
          let b = 2 * k * m * n;
          let c = k * (m * m + n * n);

          let product = a * b * c;

          if product > max_product {
            max_product = product;
          }
        }
      }
    }
    println!("{}", max_product);
  }
}
