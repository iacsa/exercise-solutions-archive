pub fn reply (query: &str) -> &'static str {
  if query.ends_with("?") {
    "Sure."
  } else if query.find(char::is_lowercase).is_none()
         && query.find(char::is_uppercase).is_some() {
    "Whoa, chill out!"
  } else if query.trim().is_empty() {
    "Fine. Be that way!"
  } else {
    "Whatever."
  }
}
