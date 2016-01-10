pub fn hex_to_int(hex: &str) -> Option<u64> {
  u64::from_str_radix(hex, 16).ok()
}
