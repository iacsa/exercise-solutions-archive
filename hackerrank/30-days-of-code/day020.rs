fn main() {
  let mut input = String::new();
  std::io::stdin().read_line(&mut input).expect("Could not read stdin!");

  let words = input.trim().split(|c: char| !c.is_alphabetic())
                          .filter(|&w| w.len() > 0)
                          .collect::<Vec<_>>();

  println!("{}", words.len());

  for word in words {
    println!("{}", word);
  }
}
