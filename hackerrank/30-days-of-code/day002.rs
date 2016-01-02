use std::io::{self, BufRead};
use std::str::FromStr;

fn read_line<F>() -> Result<F, F::Err> where F: FromStr {
  let mut input = String::new();
  io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input.trim().parse()
}

fn main() {
  // Its actually easier to read them all as floats,
  // so we don't need to convert for the arithmetics
  let original_price = read_line::<f64>().unwrap_or(0.0);
  let tip_percent = read_line::<f64>().unwrap_or(0.0);
  let tax_percent = read_line::<f64>().unwrap_or(0.0);

  let full_price = original_price * (1.0 + tip_percent / 100.0
                                         + tax_percent / 100.0);
  
  let rounded_price = full_price.round() as i64;
  
  println!("The final price of the meal is ${}.", rounded_price);
}
