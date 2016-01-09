use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn same_digits(mut n1: usize, mut n2: usize) -> bool {
  let mut digits = vec![0; 10];
  while n1 > 0 {
    digits[n1 % 10] += 1;
    n1 /= 10;
  }
  while n2 > 0 {
    digits[n2 % 10] -= 1;
    n2 /= 10;
  }
  digits.iter().all(|&d| d == 0)
}


fn main() {
  let input = read_multiple::<usize>(" ");
  let (limit, max_k) = (input[0], input[1]);

  for number in 1 .. limit + 1 {
    if (2 .. max_k + 1).all(|k| same_digits(number, k * number)) {
      for k in 1 .. max_k + 1 {
        print!("{} ", k * number);
      }
      println!("");
    }
  }
}
