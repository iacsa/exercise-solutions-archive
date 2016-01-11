use std::str::FromStr;
use std::io::stdin;


fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}


fn main() {
  let input_count = read_one::<u64>();

  for _ in 0 .. input_count {
    let n = read_one::<u64>();

    println!("{:b}", n);
  }
}
