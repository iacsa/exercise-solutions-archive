use std::collections::HashMap;

pub fn count (c: char, strain: &str) -> usize {
  *nucleotide_counts(strain).get(&c).unwrap()
}

pub fn nucleotide_counts (strain: &str) -> HashMap<char, usize> {
  let mut map = HashMap::new();

  // Default values
  for c in "AGTC".chars() { map.insert(c, 0); }

  // Count occurrences
  for c in strain.chars() { *map.get_mut(&c).unwrap() += 1 }

  map
}
