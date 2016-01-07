pub type Domino = (usize, usize);

pub fn chain(dominoes: &[Domino]) -> Option<Vec<Domino>> {

  // An empty chain is a correct result
  if dominoes.len() == 0 { return Some(vec![]) }

  // Make mutable copy for `continue_chain` to modify
  let mut dominoes = dominoes.to_vec();

  // The chain must be circular, so it can start with any domino
  // Choose the first and keep it fixed
  let d = dominoes[0];
  if continue_chain(&mut dominoes[1 .. ], d.1, d.0) {
    Some(dominoes)
  } else {
    None
  }
}

fn continue_chain(dominoes: &mut[Domino], start_with: usize, end_with: usize) -> bool {

  // If the chain is closed, report success
  if dominoes.len() == 0 && start_with == end_with { return true }

  // Try out every domino, until we find one that fits and has a further continuation
  for i in 0 .. dominoes.len() {

    // Bring domino to the front
    dominoes.swap(0, i);

    // Turn the domino if it helps
    if dominoes[0].1 == start_with { dominoes[0] = (dominoes[0].1, dominoes[0].0); }

    // If the domino fits, recursively continue the chain
    let d = dominoes[0];
    if d.0 == start_with && continue_chain(&mut dominoes[1 .. ], d.1, end_with) {
      return true
    }

    // Put domino back where it was
    dominoes.swap(0, i);
  }

  // Backtrack if no domino was able to complete the chain
  false
}
