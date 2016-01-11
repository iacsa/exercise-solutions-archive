use std::str::FromStr;
use std::io::{stdin, Read};


fn read_rest_multiple<F>(sep: &str) -> Vec<Vec<F>> where F: FromStr {
  let mut input = String::new();
  stdin().read_to_string(&mut input).expect("Could not read stdin!");
  input.lines().map(|s| s.split(sep).map(|token| token.parse().ok().unwrap()).collect()).collect()
}


fn main() {
  let matrix = read_rest_multiple::<i64>(" ");

  let mut max = 0 - 100;

  for row in 1 .. 5 {
    for col in 1 .. 5 {
      let mut sum = matrix[row][col];
      for j in col - 1 .. col + 2 {
        sum += matrix[row - 1][j] + matrix[row + 1][j];
      }
      if sum > max { max = sum; }
    }
  }

  println!("{}", max);
}
