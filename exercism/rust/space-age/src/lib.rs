pub struct Duration {
  earth_years: f64
}

impl From<u64> for Duration {
  fn from(s: u64) -> Self {
    Duration{ earth_years: s as f64 / 31557600.0 }
  }
}

pub trait Planet {
  fn time_quotient() -> f64;
  fn years_during(d: &Duration) -> f64 {
    d.earth_years / Self::time_quotient()
  }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
  fn time_quotient() -> f64 { 0.2408467 }
}
impl Planet for Venus {
  fn time_quotient() -> f64 { 0.61519726 }
}
impl Planet for Earth {
  fn time_quotient() -> f64 { 1f64 }
}
impl Planet for Mars {
  fn time_quotient() -> f64 { 1.8808158 }
}
impl Planet for Jupiter {
  fn time_quotient() -> f64 { 11.862615 }
}
impl Planet for Saturn {
  fn time_quotient() -> f64 { 29.447498 }
}
impl Planet for Uranus {
  fn time_quotient() -> f64 { 84.016846 }
}
impl Planet for Neptune {
  fn time_quotient() -> f64 { 164.79132 }
}
