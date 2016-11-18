use std::str::Chars;

pub struct Brackets {
  string: String,
  balanced: bool
}

fn is_balanced(s: &mut Chars) -> bool {
  let mut stack = Vec::new();
  while let Some(next) = s.next() {
    match next {
      '(' | '{' | '[' => stack.push(next),
      ')' => if stack.pop() != Some('(') { return false },
      '}' => if stack.pop() != Some('{') { return false },
      ']' => if stack.pop() != Some('[') { return false },
      _ => ()
    }
  }
  stack.is_empty()
}

impl Brackets {

  pub fn from(s: &str) -> Self {
    Brackets{
      string: s.to_string(),
      balanced: is_balanced(&mut s.chars())
    }
  }

  pub fn are_balanced(&self) -> bool {
    self.balanced
  }
}
