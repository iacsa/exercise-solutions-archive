extern crate rand;
use rand::{thread_rng, sample};

const DIGITS:  &'static [char] =
  &['0','1','2','3','4','5','6','7','8','9'];
const LETTERS: &'static [char] =
  &['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

pub struct Robot {
  name: String
}

impl Robot {
  pub fn new () -> Self {
    Robot{ name: Self::generate_name() }
  }

  pub fn name<'a> (&'a self) -> &'a str {
    &self.name[..]
  }

  pub fn reset_name (&mut self) {
    self.name = Self::generate_name();
  }

  fn generate_name () -> String {
    // A robot name consists of 2 letters followed by 3 digits
    let mut chars = sample(&mut thread_rng(), LETTERS.iter(), 2);
    chars.append(&mut sample(&mut thread_rng(), DIGITS.iter(), 3));

    chars.iter().map(|c| **c).collect()
  }
}
