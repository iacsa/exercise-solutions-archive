pub type Value = i64;

pub struct WordProblem {
  s: String
}

impl WordProblem {

  pub fn new(s: &str) -> Self {
    WordProblem{s: s.to_string()}
  }

  fn expect(&self, iter: &mut Iterator<Item=&str>, s: &'static str) -> Result<(), &'static str> {
    if iter.next() == Some(s) {
      Ok(())
    } else {
      Err("Incorrect syntax.")
    }
  }

  fn expect_number<F>(&self, iter: &mut Iterator<Item=&str>, f: F) -> Result<Value, &'static str>
    where F: Fn (Value) -> Value {
      if let Some(word) = iter.next() {
        if let Ok(number) = word.parse() {
          return self.expect_operation(iter, f(number))
        }
      }
      Err("Number expected but not found.")
    }

  fn expect_operation(&self, iter: &mut Iterator<Item=&str>, v: Value) -> Result<Value, &'static str>{
    if let Some(word) = iter.next() {
      match word {
        "plus" => {
          self.expect_number(iter, |y| v + y)
        },
        "minus" => {
          self.expect_number(iter, |y| v - y)
        },
        "multiplied" => {
          try!{ self.expect(iter, "by") }
          self.expect_number(iter, |y| v * y)
        },
        "divided" => {
          try!{ self.expect(iter, "by") }
          self.expect_number(iter, |y| v / y)
        },
        /* could be extended, e.g.
        "cubed" => {
          self.expect_operation(iter, v.pow(3))
        },
        */
        _ => Err("Unknown operation.")
      }
    } else {
      Ok(v) // End of question
    }
  }

  pub fn answer(&self) -> Result<Value, &'static str> {

    if !self.s.ends_with("?") {
      return Err("Incorrect syntax!");
    }

    let mut words = self.s[.. self.s.len() - 1] .split_whitespace();

    try!{ self.expect(&mut words, "What") }
    try!{ self.expect(&mut words, "is") }

    self.expect_number(&mut words, |x| x)
  }
}
