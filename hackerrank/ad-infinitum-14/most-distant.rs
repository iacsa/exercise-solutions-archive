use std::str::FromStr;
use std::io::stdin;

fn read_line() -> String {
  let mut input = String::new();
  stdin().read_line(&mut input).expect("Could not read stdin!");
  input
}

fn read_one<F>() -> F where F: FromStr {
  read_line().trim().parse().ok().unwrap()
}

fn read_multiple<F>(sep: &str) -> Vec<F> where F: FromStr {
  read_line().trim().split(sep).map(|token| token.parse().ok().unwrap()).collect()
}


fn main() {
  let input_count = read_one::<u64>();

  let first_input = read_multiple::<i64>(" ");
  let mut max_x = first_input[0];
  let mut min_x = max_x;
  let mut max_y = first_input[1];
  let mut min_y = max_y;

  for _ in 1 .. input_count {
    let input = read_multiple::<i64>(" ");
    let (x, y) = (input[0], input[1]);
    if x < min_x { min_x = x; }
    if x > max_x { max_x = x; }
    if y < min_y { min_y = y; }
    if y > max_y { max_y = y; }
  }

  let distance = vec![(max_x - min_x) as f64,
                      (max_y - min_y) as f64,
                      ((max_y.pow(2) + max_x.pow(2)) as f64).sqrt(),
                      ((min_y.pow(2) + min_x.pow(2)) as f64).sqrt(),
                      ((max_y.pow(2) + min_x.pow(2)) as f64).sqrt(),
                      ((min_y.pow(2) + max_x.pow(2)) as f64).sqrt()];

  let mut max_distance = distance[0];

  for d in distance {
    if d > max_distance { max_distance = d; }
  }

  println!("{}", max_distance);
}
