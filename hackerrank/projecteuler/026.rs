use std::str::FromStr;
use std::collections::HashMap;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}


fn cycle_length(denom: usize) -> usize {
  let mut seen = HashMap::<usize, usize>::new();
  let mut value = 1;
  for iter in 0 .. {
    if value == 0 { return 0 };
    if seen.contains_key(&value) { return iter - seen[&value] }
    seen.insert(value, iter);
    value = value * 10 % denom;
  }
  0 // Never actually reached
}

fn main() {
  let input_count = read_one::<usize>();

  // Pre-build the maximal indices
  let mut max_is = vec![0; 10000];
  let mut max_len = 0;

  for denom in 1 .. 10000 {
    let len = cycle_length(denom);
    if len > max_len {
      max_is[denom] = denom;
      max_len = len;
    } else {
      max_is[denom] = max_is[denom - 1];
    }
  }

  for _ in 0 .. input_count {
    let limit = read_one::<usize>();
    println!("{}", max_is[limit - 1]);
  }
}


#[cfg(test)]
mod tests {
  use super::cycle_length;

  #[test]
  fn test_unique_powers_1() { assert_eq!(cycle_length(1), 0); }
  #[test]
  fn test_unique_powers_2() { assert_eq!(cycle_length(2), 0); }
  #[test]
  fn test_unique_powers_3() { assert_eq!(cycle_length(3), 1); }
  #[test]
  fn test_unique_powers_4() { assert_eq!(cycle_length(4), 0); }
  #[test]
  fn test_unique_powers_5() { assert_eq!(cycle_length(5), 0); }
  #[test]
  fn test_unique_powers_6() { assert_eq!(cycle_length(6), 1); }
  #[test]
  fn test_unique_powers_7() { assert_eq!(cycle_length(7), 6); }
  #[test]
  fn test_unique_powers_8() { assert_eq!(cycle_length(8), 0); }
  #[test]
  fn test_unique_powers_9() { assert_eq!(cycle_length(9), 1); }
  #[test]
  fn test_unique_powers_10() { assert_eq!(cycle_length(10), 0); }
}
