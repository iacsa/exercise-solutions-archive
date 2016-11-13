use std::ascii::AsciiExt;

fn reverse(c: char) -> char {
  if c.is_alphabetic() {
    (b'z' + b'a' - (c as u8)) as char
  } else {
    c
  }
}

pub fn encode(text: &str) -> String {
  let mut cipher: String = String::new();

  for (i, c) in
    text.to_lowercase()
        .chars()
        .filter(|c| c.is_alphanumeric() && c.is_ascii())
        .map(&reverse)
        .enumerate() {
    if i % 5 == 0 && i > 0 { cipher.push(' ')}
    cipher.push(c);
  }
  
  cipher
}

pub fn decode(cipher: &str) -> String {
  cipher.chars().filter(|&c| c != ' ').map(&reverse).collect()
}
