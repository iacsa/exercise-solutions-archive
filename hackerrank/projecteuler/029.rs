use std::str::FromStr;


fn read_line() -> String {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}


fn gcd(mut a: usize, mut b: usize) -> usize {
  while a > 0 {
    let tmp = a;
    a = b % a;
    b = tmp;
  }
  b
}

// Based on "WP"'s solution from the ProjectEuler forums
fn unique_powers(limit: usize) -> usize {

  let max_power = (limit as f64).log2() as usize;
  let sqrt_limit = (limit as f64).sqrt() as usize;

  let mut power_count = vec![0; max_power + 1];
  let mut not_checked = vec![true; sqrt_limit + 1];

  for i in 2 .. sqrt_limit + 1 {
    if not_checked[i] {
      let mut b = i;
      for p in 2 .. {
        b *= i;
        if b > limit { break }
        power_count[p] += 1;
        if b <= sqrt_limit { not_checked[b] = false; }
      }
    }
  }

  let duplicates = (2 .. max_power + 1).fold(0, |sum, i| {
    let mut power_overlap = vec![false; limit + 1];
    for k in 1 .. i {
      let step = k / gcd(k, i);
      for l in 1 .. gcd(k, i) * limit / i + 1{
        power_overlap[l * step] = true;
      }
    }
    sum + power_overlap[2 ..].iter().filter(|&&b| b).count() * power_count[i]
  });

  (limit - 1).pow(2) - duplicates
}


fn main() {
  let limit = read_one::<usize>();
  println!("{}", unique_powers(limit));
}


#[cfg(test)]
mod tests {
  use super::unique_powers;

  #[test]
  fn test_unique_powers_100() { assert_eq!(unique_powers(100), 9_183); }
  #[test]
  fn test_unique_powers_256() { assert_eq!(unique_powers(256), 62_136); }
  #[test]
  fn test_unique_powers_1_000() { assert_eq!(unique_powers(1_000), 977_358); }
  #[test]
  fn test_unique_powers_8_192() { assert_eq!(unique_powers(8_192), 66_620_202); }
  #[test]
  fn test_unique_powers_10_000() { assert_eq!(unique_powers(10_000), 99_347_607); }
  #[test]
  fn test_unique_powers_16_384() { assert_eq!(unique_powers(16_384), 267_106_579); }
  #[test]
  fn test_unique_powers_32_768() { assert_eq!(unique_powers(32_768), 1_070_072_513); }
  #[test]
  fn test_unique_powers_100_000() { assert_eq!(unique_powers(100_000), 9_981_236_306); }
  #[test]
  fn test_unique_powers_1_000_000() { assert_eq!(unique_powers(1_000_000), 999_438_868_292); }
}
