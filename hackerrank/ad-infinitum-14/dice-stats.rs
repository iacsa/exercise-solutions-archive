use std::str::FromStr;
use std::io::stdin;
fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}
fn read_one<F>() -> F where F: FromStr { read_line().trim().parse().ok().unwrap() }


fn main() {
  let mut p = vec![];
  for _ in 0 .. 6 {
    p.push(read_one::<f64>());
  }

  let n = read_one::<usize>();

}
