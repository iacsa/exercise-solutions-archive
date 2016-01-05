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


const VALUES: &'static[usize] = &[1, 2, 5, 10, 20, 50, 100, 200];

fn main() {
  let input_count = read_one::<usize>();

  let max = 100001;
  let m = VALUES.len();
  let modulo = 10usize.pow(9) + 7;

  let mut arr: Vec<Vec<usize>> = vec![vec![1; m]; max];

  for i in 1 .. max {
    for j in 1 .. m {
      if i >= VALUES[j] {
        arr[i][j] = (arr[i][j - 1] + arr[i - VALUES[j]][j]) % modulo;
      } else {
        arr[i][j] = arr[i][j - 1];
      }
    }
  }

  for _ in 0 .. input_count {
    let n = read_one::<usize>();
    println!("{}", arr[n][m - 1]);
  }
}
