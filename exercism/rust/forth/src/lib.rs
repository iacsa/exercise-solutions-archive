extern crate regex;

use std::collections::HashMap;
use regex::Regex;

pub type Value = i32;
pub type ForthResult = Result<(), Error>;
type ApplyResult = Result<Vec<isize>, Error>;

pub struct Forth {
  stack: Vec<isize>,
  custom_ops: HashMap<String, String>
}

#[derive(Debug, PartialEq)]
pub enum Error {
  DivisionByZero,
  StackUnderflow,
  UnknownWord,
  InvalidWord,
}

// let valid_definition = Regex::new(r"^: ([^:;0-9][^:;]*?) ([^:;]+) ;(.*)$").unwrap();

impl Forth {
  pub fn new () -> Self {
    Forth{ stack: vec![], custom_ops: HashMap::new() }
  }

  pub fn format_stack (&self) -> String {
    self.stack.iter().map(|e| format!("{} ", e)).collect::<String>().trim().to_string()
  }

  // Some helper functions to make evaluating operators easier
  fn apply_1<F> (&mut self, f: F) -> ForthResult where F: Fn (isize) -> ApplyResult {
    if self.stack.len() < 1 { return Err(Error::StackUnderflow) }
    let x = self.stack.pop().unwrap();
    self.process_apply_result(f(x))
  }
  fn apply_2<F> (&mut self, f: F) -> ForthResult where F: Fn (isize, isize) -> ApplyResult {
    if self.stack.len() < 2 { return Err(Error::StackUnderflow) }
    let (y, x) = (self.stack.pop().unwrap(), self.stack.pop().unwrap());
    self.process_apply_result(f(x, y))
  }
  fn process_apply_result (&mut self, res: ApplyResult) -> ForthResult {
    res.map(|mut results| { self.stack.append(&mut results); })
  }

  fn reduce_with (&mut self, input: &str) -> ForthResult {
    // First, check if "input" was defined by the user
    if self.custom_ops.contains_key(input) {
      let definition = self.custom_ops.get(input).unwrap().to_string();
      return self.eval(&definition)
    }

    // If not, match it against the built-ins
    match input {
      "+" => self.apply_2(|x, y| Ok(vec![x + y])),
      "-" => self.apply_2(|x, y| Ok(vec![x - y])),
      "*" => self.apply_2(|x, y| Ok(vec![x * y])),
      "/" => self.apply_2(|x, y| if y == 0 { Err(Error::DivisionByZero) } else { Ok(vec![x / y]) }),
      "dup" => self.apply_1(|x| Ok(vec![x, x])),
      "drop" => self.apply_1(|_| Ok(vec![])),
      "swap" => self.apply_2(|x, y| Ok(vec![y, x])),
      "over" => self.apply_2(|x, y| Ok(vec![x, y, x])),
      _  => Err(Error::UnknownWord)
    }
  }

  pub fn eval (&mut self, input: &str) -> ForthResult {
    let input = input.trim().to_lowercase();
    if input.len() == 0 { return Ok (()) }

    // Evaluating is a recursive process.
    // From the input we extract the first expression and evaluate it,
    // then we simply call eval on the rest of the input.
    // An expression can be either:
    // 1. An operator definition
    // 2. A number
    // 3. An operator call
    
    // Try to define an operator
    if input.starts_with(":") {
      let valid_definition = Regex::new(r"^: ([^:;0-9][^:;]*?) ([^:;]+) ;(.*)$").unwrap();
      if !valid_definition.is_match(&input) { return Err(Error::InvalidWord) }
      let captures = valid_definition.captures_iter(&input).next().unwrap();
      let (name, definition, rest) = (captures.at(1).unwrap(), captures.at(2).unwrap(), captures.at(3).unwrap());
      self.custom_ops.insert(name.to_string(), definition.to_string());
      return self.eval(rest)
    }

    let rex = Regex::new(r"^([^\s[:cntrl:]]+)[\s[:cntrl:]]*(?s)(.*)").unwrap();
    let captures = rex.captures_iter(&input).next().unwrap();
    let (first, rest) = (captures.at(1).unwrap(), captures.at(2).unwrap());

    if let Ok(number) = first.parse() {
      self.stack.push(number);
    } else {
      if let Err(err) = self.reduce_with(first) { return Err(err) }
    }
    return self.eval(rest)
  }
}
