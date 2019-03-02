use std::str::FromStr;
use std::io::stdin;
use std::cmp::max;
const MOD: u64 = 1000000000;
fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}
fn read_one<F>() -> F where F: FromStr { read_line().trim().parse().ok().unwrap() }
fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr { read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect() }
fn mat_mul(mat1: &[Vec<u64>], mat2: &[Vec<u64>]) -> Vec<Vec<u64>> {
  let size = mat1.len();
  let mut result = vec![vec![0; size]; size];
  for i in 0 .. size {
    for j in 0 .. size {
      for k in 0 .. size {
        result[i][j] += mat1[i][k] * mat2[k][j];
        result[i][j] %= MOD;
      }
    }
  }
  result
}
fn mat_exp(mat: &[Vec<u64>], n: u64) -> Vec<Vec<u64>> {
  if n == 1 { mat.to_owned() }
  else if n % 2 == 0 { mat_exp(&mat_mul(mat, mat), n / 2) }
  else { mat_mul(&mat_exp(mat, n - 1), mat) }
}
fn main() {
  let input_count = read_one::<u64>();
  for _ in 0 .. input_count {
    let input = read_multiple::<u64>(" ");
    let a = input[0];
    let b = input[1];
    let c = input[2];
    let d = input[3];
    let e = input[4];
    let f = input[5];
    let g = input[6];
    let h = input[7];
    let n = input[8];
    let max_x = max(a, max(f, g));
    let max_y = max(b, max(c, e));
    let d_ind = max_x + max_y;
    let h_ind = d_ind + 2;
    let size = h_ind + 2;
    let mut y: Vec<u64> = vec![];
    let mut mat: Vec<Vec<u64>> = vec![vec![]; size as usize];
    for i in 0 .. size {
      y.push(
        if i == d_ind || i == h_ind { 0 }
        else if i == d_ind + 1 { d }
        else if i == h_ind + 1 { h }
        else { 1 }
      );
    }
    for i in 0 .. size {
      for j in 0 .. size {
        mat[i as usize].push(
          if i == 0 { [a - 1, b - 1 + max_x, c - 1 + max_x, d_ind].iter().filter(|&&k| k == j).count() as u64 }
          else if i == max_x { [f - 1, g - 1, e - 1 + max_x, h_ind].iter().filter(|&&k| k == j).count() as u64 }
          else if i == d_ind { if j == d_ind { d } else if j == d_ind + 1 { 1 } else { 0 } }
          else if i == d_ind + 1 { if j == i { d } else { 0 } }
          else if i == h_ind { if j == h_ind { h } else if j == h_ind + 1 { 1 } else { 0 } }
          else if i == h_ind + 1 { if j == i { h } else { 0 } }
          else if i == j + 1 { 1 }
          else { 0 }
        );
      }
    }
    let result = mat_exp(&mat, n + 1);
    let mut x1 = 0;
    let mut x2 = 0;
    for i in 0 .. size as usize {
      x1 += result[0][i] * y[i];
      x1 %= MOD;
      x2 += result[max_x as usize][i] * y[i];
      x2 %= MOD;
    }
    println!("{} {}", x1, x2);
  }
}
