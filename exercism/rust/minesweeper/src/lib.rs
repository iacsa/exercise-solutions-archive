const CHARS: &'static[char] =
  &[' ', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

pub fn annotate (board: &[&str]) -> Vec<String> {
  let h = board.len();
  let w = board.first().unwrap().len();

  let mut counts: Vec<usize> = vec![0; (h + 2) * (w + 2)];
  for (y, row) in board.iter().enumerate() {
    for (x, _) in row.chars().enumerate().filter(|&(_, cell)| cell == '*') {
      for dx in 0 .. 3 {
        for dy in 0 .. 3 {
          *counts.get_mut((x + dx) * (h + 2) + y + dy).unwrap() += 1
        }
      }
    }
  }

  board.iter().enumerate().map(|(y, row)|
    row.chars().enumerate().map(|(x, cell)|
      if cell == '*' { '*' }
      else { *CHARS.get(*counts.get((x + 1) * (h + 2) + y + 1).unwrap()).unwrap() }
    ).collect()
  ).collect()
}
