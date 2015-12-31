pub fn hamming_distance (s1: &str, s2: &str) -> Result<usize, &'static str> {
  if s1.len() == s2.len() {
    Result::Ok(s1.chars().zip(s2.chars()).filter(|&(c1, c2)| c1 != c2).count())
  } else {
    Result::Err("inputs of different length")
  }
}
