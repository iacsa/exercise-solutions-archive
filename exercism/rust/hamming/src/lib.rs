pub fn hamming_distance(s1: &str, s2: &str) -> Result<usize, &'static str> {
  if s1.len() > s2.len() {
    Err("First string is longer!")
  } else if s2.len() > s1.len() {
    Err("Second string is longer!")
  } else {
    Ok(s1.chars().zip(s2.chars()).filter(|&(x, y)| x != y).count())
  }
}
