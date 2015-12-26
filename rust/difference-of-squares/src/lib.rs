pub fn square_of_sum (n: u32) -> u32 {
  power_sum(n, 2, 1)
}
pub fn sum_of_squares (n: u32) -> u32 {
  power_sum(n, 1, 2)
}
pub fn difference (n: u32) -> u32 {
  square_of_sum(n) - sum_of_squares(n)
}

fn power_sum (n: u32, outer_power: u32, inner_power: u32) -> u32 {
  (1..n+1).fold(0, |sum, k| sum + k.pow(inner_power)).pow(outer_power)
}
