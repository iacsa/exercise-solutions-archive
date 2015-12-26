use std::collections::HashMap;

pub struct Info {
  map: HashMap<String, String>
}

impl Info {
  pub fn name_for (&self, s: &str) -> Result<&str, &str> {
    match self.map.get(&self.map_shorthands(s)) {
      Some(name) => Ok(name),
      None => Err("illegal codon sequence")
    }
  }
  fn map_shorthands (&self, s: &str) -> String {
    s.chars().map(|c|
      match c {
        'W'|'N'|'R'|'H' => 'A',
        'K'|'B'|'D'|'V' => 'G',
        'S'|'M'|'Y' => 'C',
        _ => c
      }
    ).collect()
  }
}

pub fn parse (v: Vec<(&str, &str)>) -> Info {
  let mut map = HashMap::new();
  for (name, codon) in v {
    map.insert(name.to_string(), codon.to_string());
  }
  Info{map: map}
}
