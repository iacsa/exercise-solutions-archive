extern crate regex;
use std::io::prelude::*;
use std::collections::HashMap;
use std::cmp::Ordering;
use std::fmt;
use regex::Regex;

enum Result { Win, Draw, Loss }
fn opposite(r: &Result) -> Result {
  match *r {
    Result::Win => Result::Loss,
    Result::Loss => Result::Win,
    Result::Draw => Result::Draw
  }
}

#[derive(Default, Clone)]
struct Record { name: String, wins: usize, draws: usize, losses: usize }

impl Record {
  fn new(name: &str) -> Self {
    Record { name: name.to_string(), ..Default::default() }
  }
  fn points(&self) -> usize { 3 * self.wins + self.draws }
  fn add_result(&mut self, r: &Result) {
    match *r {
      Result::Win => self.wins += 1,
      Result::Draw => self.draws += 1,
      Result::Loss => self.losses += 1
    }
  }
}

fn order(x: &&Record, y: &&Record) -> Ordering {
  match (y.points().cmp(&x.points()), y.wins.cmp(&x.wins)) {
    (Ordering::Equal, Ordering::Equal) => x.name.cmp(&y.name),
    (Ordering::Equal, other) => other,
    (other, _) => other
  }
}

impl fmt::Display for Record {
  fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
    write!(f, "{:<30} | {:>2} | {:>2} | {:>2} | {:>2} | {:>2}",
           self.name, self.wins + self.draws + self.losses,
           self.wins, self.draws, self.losses, self.points())
  }
}

fn parse_result(s: &str) -> Result {
  match s {
    "win" => Result::Win,
    "loss" => Result::Loss,
    "draw" => Result::Draw,
    _ => panic!("Unexpected result found: {}", s)
  }
}

pub fn tally(input: &str) -> String {
  let mut records: HashMap<String, Record> = HashMap::new();
  let valid_row = Regex::new(r"^.*;.*;(loss|win|draw)$").unwrap();

  for line in input.split('\n').filter(|s| valid_row.is_match(s)) {
    let tokens = line.split(';').collect::<Vec<_>>();
    let result = parse_result(tokens[2]);
    records.entry(tokens[0].to_string())
           .or_insert(Record::new(tokens[0]))
           .add_result(&result);
    records.entry(tokens[1].to_string())
           .or_insert(Record::new(tokens[1]))
           .add_result(&opposite(&result));
  }

  let mut sorted: Vec<&Record> = records.values().collect();
  sorted.sort_by(&order);

  let mut result = "Team                           | MP |  W |  D |  L |  P".to_string();
  for record in sorted {
    result.push_str(&format!("\n{}", record));
  }
  result
}
