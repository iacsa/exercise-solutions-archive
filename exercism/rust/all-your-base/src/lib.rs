pub fn convert(number: &[u32], from_base: u32, to_base: u32) -> Result<Vec<u32>, &'static str> {

  if number.iter().any(|&d| d >= from_base) {
    return Err("Illegal digits in input number.")
  }

  if from_base < 2 || to_base < 2 {
    return Err("Bases must be at least 2.")
  }

  let mut value = number.iter().fold(0, |acc, digit| acc * from_base + digit);
  let mut result = Vec::new();

  while value > 0 {
    result.push(value % to_base);
    value = value / to_base;
  }
  result.reverse();

  Ok(result)
}
