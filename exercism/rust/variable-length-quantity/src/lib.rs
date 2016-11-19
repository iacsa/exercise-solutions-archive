use std::collections::VecDeque;

/// Convert a list of numbers to a stream of bytes encoded with variable length encoding.
pub fn to_bytes(values: &[u32]) -> Vec<u8> {
  values.iter().flat_map(|&value| {
    let mut result = VecDeque::with_capacity(5);
    let mut v = value;
    result.push_front((v % 128) as u8);
    while v > 127 {
      v /= 128;
      result.push_front((v % 128) as u8 + 128);
    }
    result
  }).collect()
}

/// Given a stream of bytes, extract all numbers which are encoded in there.
pub fn from_bytes(bytes: &[u8]) -> Result<Vec<u32>, &'static str> {
  if !bytes.is_empty() && *bytes.last().unwrap() >= 128 {
    return Err("byte stream ended irregularly")
  }
  let mut result = Vec::new();
  let mut value: u32 = 0;
  for &byte in bytes {
    if let Some(checked_value) = value.checked_mul(128) {
      value = checked_value + byte as u32 % 128;
      if byte < 128 {
        result.push(value);
        value = 0;
      }
    } else {
      return Err("u32 overflow detected")
    }
  }

  Ok(result)
}
