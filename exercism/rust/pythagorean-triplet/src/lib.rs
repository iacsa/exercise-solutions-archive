use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {

  // From      a + b + c = sum
  // And       a < b < c
  // Follows   a + a + a = 3 * a < sum
  // Therefore a < sum / 3
  // This becomes a <= sum / 3 due to integer division
  (1..=(sum/3)).flat_map(|a| {

    // From      a + b + c = sum
    // And       b < c
    // Follows   b + b = 2 * b < sum - a
    // Therefore b < (sum - a) / 2
    // This becomes b <= (sum - a) / 2 due to integer division
    (a+1..=(sum - a)/2).filter_map(move |b| {
      let c = sum - a - b;
      if is_pythagorean_triple([a, b, c]) {
        Some([a, b, c])
      } else {
        None
      }
    })
  }).collect()
}


fn is_pythagorean_triple(triple: [u32; 3]) -> bool {
  let [a, b, c] = triple;
  a * a + b * b == c * c
}
