use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}


fn main() {
  let limit = read_one::<usize>();

  let mut prime = vec![true; limit];
  prime[0] = false; prime[1] = false;
  // Sieve of Eratosthenes to find primes
  for p in 2 .. limit {
    if prime[p] {
      let mut multiple = 2 * p;
      while multiple < limit {
        prime[multiple] = false;
        multiple += p;
      }
    }
  }

  let mut right_truncatable = prime.clone();
  let mut left_truncatable = prime.clone();
  // For the algorithm we'll assume one digit primes to be truncatable
  for p in 10 .. limit {
    right_truncatable[p] &= right_truncatable[p / 10];
    left_truncatable[p] &= left_truncatable[p % 10usize.pow((p as f64).log10() as u32)];
  }

  // Now we'll simply skip the one digit numbers
  let sum = (10 .. limit).filter(|&p| right_truncatable[p] && left_truncatable[p]).fold(0, |sum, p| sum + p);
  println!("{}", sum);
}
