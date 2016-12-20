pub fn sum_of_multiples(limit: i64, nums: &[i64]) -> i64 {
  (1 .. limit).filter(|n| nums.iter().any(|k| n % k == 0)).sum()
}
