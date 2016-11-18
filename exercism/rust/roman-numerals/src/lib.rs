const DIGITS: &'static[(u32, &'static str)] = &[
  (1000, "M"),
  (900, "CM"),
  (500, "D"),
  (400, "CD"),
  (100, "C"),
  (90, "XC"),
  (50, "L"),
  (40, "XL"),
  (10, "X"),
  (9, "IX"),
  (5, "V"),
  (4, "IV"),
  (1, "I")
];


pub struct Roman {
  value: u32,
  text: String
}

impl Roman {

  pub fn from(n: u32) -> Self {

    let mut rest = n;
    let mut text = String::new();

    for &(value, digit) in DIGITS {
      while value <= rest {
        rest -= value;
        text.push_str(digit);
      }
    }
    Roman{ value: n, text: text }
  }

  pub fn to_string(&self) -> String {
    self.text.clone()
  }
}
