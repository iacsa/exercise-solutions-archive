pub fn hex_to_int (hex: &str) -> Option<usize> {
  match usize::from_str_radix(hex, 16) {
    Ok(value) => Some(value),
    Err(_) => None
  }
}
