use std::collections::HashMap;

pub fn word_count (s: &str) -> HashMap<String, u32>{
  s.split(|c: char| !c.is_alphanumeric()).
    filter(|w| !w.is_empty()).
    fold(HashMap::new(), |mut dict, word| {
      *dict.entry(word.to_lowercase()).or_insert(0) += 1; dict
    })
}
