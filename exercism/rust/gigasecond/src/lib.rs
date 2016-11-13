extern crate chrono;
use chrono::*;

pub fn after(start_date: DateTime<UTC>) -> DateTime<UTC> {
  UTC.timestamp(start_date.timestamp() + 1_000_000_000, 0)
}
