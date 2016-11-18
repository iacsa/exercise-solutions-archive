use std::str::Chars;

fn abbreviate_helper(mut rest: Chars, last: char, mut result: String) -> String {
  match rest.next() {
    None => result,
    Some(current) => {
      if current.is_alphabetic() && (!last.is_alphabetic() || current.is_uppercase() && last.is_lowercase()) {
        result.push(current);
      }
      abbreviate_helper(rest, current, result)
    }
  }

}

pub fn abbreviate(name: &str) -> String {
  abbreviate_helper(name.chars(), ' ', String::new()).to_uppercase()
}
