pub fn primes_up_to(limit: usize) -> Vec<usize> {
  let mut prime_candidates = vec![true; limit + 1];

  (2 .. limit + 1).filter(|&p| {
    if prime_candidates[p] {
      for k in p .. limit / p + 1 {
        prime_candidates[k * p] = false;
      }
    }
    prime_candidates[p]
  }).collect()
}
