pub fn count (board: &[&str]) -> usize {
  let height = board.len();
  let width = board.first().map(|row| row.len()).unwrap_or(0);

  (0 .. height).flat_map(|y1| {
    (0 .. width).flat_map(move |x1| {
      (x1 + 1 .. width).flat_map(move |x2| {
        (y1 + 1 .. height).filter(move |&y2| is_rectangle(board, x1, y1, x2, y2))
      })
    })
  }).count()
}

fn is_rectangle (board: &[&str], x1: usize, y1: usize,
                                 x2: usize, y2: usize) -> bool {
  [x1, x2].iter().all(|x| [y1, y2].iter().all(|y| is_corner(board, *x, *y))) &&
    [y1, y2].iter().all(|y| (x1 + 1 .. x2).all(|x| is_horizontal(board, x, *y))) &&
    [x1, x2].iter().all(|x| (y1 + 1 .. y2).all(|y| is_vertical(board, *x, y)))
}

fn is_corner (board: &[&str], x: usize, y: usize) -> bool {
  is_str(board, x, y, "+")
}
fn is_vertical (board: &[&str], x: usize, y: usize) -> bool {
  is_corner(board, x, y) || is_str(board, x, y, "|")
}
fn is_horizontal (board: &[&str], x: usize, y: usize) -> bool {
  is_corner(board, x, y) || is_str(board, x, y, "-")
}
fn is_str (board: &[&str], x: usize, y: usize, s: &str) -> bool {
  &board[y][x .. x + 1] == s
}
