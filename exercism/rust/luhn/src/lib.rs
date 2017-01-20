pub fn is_valid(string: &str) -> bool {
  let number = parse(string);
  let checkdigit = number.map(|k| checksum(k));
  checkdigit.is_some() && checkdigit.unwrap() % 10 == 0
}

fn parse(string: &str) -> Option<usize> {
  string.replace(" ", "").parse::<usize>().ok()
}

fn checksum(number: usize) -> usize {
  digits(number)
    .into_iter()
    .enumerate()
    .fold(0, |sum, digit| sum + value(digit))
}

fn value((index, digit): (usize, usize)) -> usize {
  let mut result = digit;
  result *= 1 + (index & 1);
  result %= 9;
  result
}

fn digits(mut number: usize) -> Vec<usize> {
  let mut result = vec![];
  loop {
    result.push(number % 10);
    number /= 10;
    if number == 0 {
      break;
    }
  }
  result
}
