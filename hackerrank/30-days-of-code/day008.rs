use std::str::FromStr;
use std::io::{Read, stdin};
use std::collections::HashMap;


fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}

fn read_rest() -> Vec<String> {
  let mut input = String::new();
  stdin().read_to_string(&mut input).expect("Could not read stdin!");
  input.lines().map(|s| s.to_string()).collect()
}


fn main() {
  let input_count = read_one::<u64>();
  let mut phone_book = HashMap::new();

  for _ in 0 .. input_count {
    let name = read_one::<String>();
    let number = read_one::<String>();

    phone_book.insert(name, number);
  }

  let names = read_rest();

  for name in names {
    if let Some(number) = phone_book.get(&name) {
      println!("{}={}", name, number);
    } else {
      println!("Not found");
    }
  }
}
