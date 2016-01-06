use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn main() {
  let input = read_multiple::<usize>(" ");
  let (n, k) = (input[0], input[1]);
  let limit = n + k;

  // Sieve of Eratosthenes can also be used to count prime factors
  let mut sieve = vec![0; limit];
  for p in 2 .. limit {
    if sieve[p] == 0 {
      let mut multiple = p;
      while multiple < limit {
        sieve[multiple] += 1;
        multiple += p;
      }
    }
  }

  for i in 1 .. n + 1 {
    if (0 .. k).all(|l| sieve[i + l] == k) {
      println!("{}", i);
    }
  }
}
