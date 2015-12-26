extern crate regex;
use std::path::Path;
use std::io::prelude::*;
use std::fs::File;
use std::collections::HashMap;
use std::cmp::Ordering;
use std::fmt;
use regex::Regex;

enum Result { Win, Draw, Loss }
fn opposite (r: &Result) -> Result {
  match *r {
    Result::Win => Result::Loss,
    Result::Loss => Result::Win,
    Result::Draw => Result::Draw
  }
}

#[derive(Default, Clone)]
struct Record { name: String, wins: usize, draws: usize, losses: usize }

impl Record {
  fn new (name: &str) -> Self {
    Record { name: name.to_string(), ..Default::default() }
  }
  fn points (&self) -> usize { 3 * self.wins + self.draws }
  fn add_result (&mut self, r: &Result) {
    match *r {
      Result::Win => self.wins += 1,
      Result::Draw => self.draws += 1,
      Result::Loss => self.losses += 1
    }
  }
}

fn order (x: &Record, y: &Record) -> Ordering {
  match y.points().cmp(&x.points()) {
    Ordering::Equal => match y.wins.cmp(&x.wins) {
      Ordering::Equal => x.name.cmp(&y.name),
      other => other
    },
    other => other
  }
}

impl fmt::Display for Record {
  fn fmt (&self, f: &mut fmt::Formatter) -> fmt::Result {
    write!(f, "{:<30} | {:>2} | {:>2} | {:>2} | {:>2} | {:>2}",
           self.name, self.wins + self.draws + self.losses,
           self.wins, self.draws, self.losses, self.points())
  }
}

fn parse_result (s: &str) -> Result {
  match s {
    "win" => Result::Win,
    "loss" => Result::Loss,
    _ => Result::Draw
  }
}

pub fn tally (input: &Path, output: &Path) -> Option<usize> {
  let mut records: HashMap<String, Record> = HashMap::new();
  let valid_row = Regex::new(r"^.*;.*;(loss|win|draw)$").unwrap();

  let count = read_input(input).split('\n').filter(|s| valid_row.is_match(s)).inspect(|line| {
    line.split(';').rev().fold(None, |acc, token| {
      if let Some(result) = acc {
        records.entry(token.to_string()).or_insert(Record::new(token)).add_result(&result);
        Some(opposite(&result))
      } else {
        Some(opposite(&parse_result(token)))
      }
    });
  }).count();

  let mut sorted: Vec<Record> = records.values().cloned().collect();
  sorted.sort_by(&order);
  write_output(output, sorted);

  if count > 0 { Some(count) } else { None }
}

fn read_input (input: &Path) -> String {
  match File::open(input) {
    Err(e) => panic!("Couldn't open supplied input file: {}", e),
    Ok(mut f) => {
      let mut buf = String::new();
      match f.read_to_string(&mut buf) {
        Err(e) => panic!("Couldn't read supplied input file: {}", e),
        Ok(_) => buf
      }
    }
  }
}

fn write_output (output: &Path, records: Vec<Record>) {
  match File::create(output) {
    Err(e) => panic!("Couldn't open supplied output file: {}", e),
    Ok(mut f) => {
      let _ = write!(f, "{:<30} | MP |  W |  D |  L |  P\n", "Team");
      for record in records {
        let _ = write!(f, "{}\n", record);
      }
    }
  }
}
