pub type Domino = (usize, usize);

pub fn chain (input: &[Domino]) -> Option<Vec<Domino>> {
  let mut rest = input.to_vec();
  // As the chain must be circular, the first domino can be any one
  rest.pop().map(|(d1, d2)| {
    continue_chain(rest, d2, d1).map(|mut domino_chain| {
      domino_chain.insert(0, (d1, d2)); domino_chain
    })
  }).unwrap_or(Some(vec![]))
}

fn continue_chain (input: Vec<Domino>,
                   start_with: usize,
                   end_with: usize) -> Option<Vec<Domino>> {

  if input.len() == 0 && start_with == end_with { return Some(vec![]) }

  // Just try out every domino, until we find one that fits and
  // has a further continuation
  for (i, &(d1, d2)) in input.iter().enumerate() {
    // Check whether domino fits, needs to be turned, or does not fit
    let (e1, e2) = if d1 == start_with { (d1, d2) } else if d2 == start_with { (d2, d1) } else { continue };

    // Check what dominoes are left
    let mut rest = input.to_vec(); rest.swap_remove(i);

    // Search for a further continuation of the chain
    if let Some(mut domino_chain) = continue_chain(rest, e2, end_with) {
      domino_chain.insert(0, (e1, e2));
      return Some(domino_chain)
    }
  }

  // If no domino was able to complete the chain, we need to backtrack
  None
}
