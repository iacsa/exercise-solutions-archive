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
  let limit = read_one::<i64>();

  let max_prime = (limit * limit) as usize;
  let mut prime = vec![true; max_prime];
  prime[0] = false; prime[1] = false;
  // Sieve of Eratosthenes to find primes
  for p in 2 .. max_prime {
    if prime[p] {
      let mut multiple = 2 * p;
      while multiple < max_prime {
        prime[multiple] = false;
        multiple += p;
      }
    }
  }

  let mut max_len = 0;
  let mut max_a_b = (0, 0);
  for a in 0 - limit .. limit + 1 {
    for b in 0 - limit .. limit + 1 {
      let mut len = 0;
      for n in 0 .. {
        if n * n + n * a + b <= 1 || !prime[(n * n + n * a + b) as usize] {
          len = n;
          break;
        }
      }
      if len > max_len {
        max_len = len;
        max_a_b = (a, b);
      }
    }
  }

  let (a, b) = max_a_b;
  println!("{} {}", a, b);
}
