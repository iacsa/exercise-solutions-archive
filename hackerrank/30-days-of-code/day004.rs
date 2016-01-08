use std::cmp::{max};


impl Person {

  fn new(initial_age: i32) -> Person {

    if initial_age < 0 {
      println!("This person is not valid, setting age to 0.");
    }

    Person { age: max(0, initial_age) }
  }

  fn amIOld(&self) {
    println!("You are {}.",
      match self.age {
        0 ... 12 => "young",
        13 ... 17 => "a teenager",
        _ => "old"
      });
  }

  fn yearPasses(&mut self) {
    self.age += 1;
  }
}
