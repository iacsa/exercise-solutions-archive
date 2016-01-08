use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn main() {

  // First input is array length, we don't actually need that
  let _ = read_one::<u64>();

  let mut array = read_multiple::<String>(" ");
  array.reverse();

  println!("{}", array.join(" "));
}
