use std::collections::BTreeMap;

pub fn transform (input: &BTreeMap<i32, Vec<String>>) -> BTreeMap<String, i32> {
  let mut output = BTreeMap::new();

  for (value, names) in input {
    for name in names {
      output.insert(name.to_lowercase(), *value);
    }
  }

  output
}
