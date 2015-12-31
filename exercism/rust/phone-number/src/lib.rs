pub fn number (s: &str) -> Option<String> {
  let clean: String = s.chars().filter(|c| c.is_digit(10)).collect();

  if clean.len() == 10 {
    Some(clean)
  } else if clean.len() == 11 && clean.starts_with("1") {
    Some(clean[1..11].to_string())
  } else {
    None
  }
}

pub fn area_code (s: &str) -> Option<String> {
  number(s).map(|num| num[0..3].to_string())
}

pub fn pretty_print (s: &str) -> String {
  match number(s) {
    Some(num) => format!("({}) {}-{}", &num[0..3],
    &num[3..6],
    &num[6..10]),
    None => "invalid".to_string()
  }
}
