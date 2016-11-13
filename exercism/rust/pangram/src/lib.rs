pub fn is_pangram(string: &str) -> bool {
  let string = string.to_lowercase();
  (b'a' .. b'z' + 1).all(|c| string.contains(c as char))
}
