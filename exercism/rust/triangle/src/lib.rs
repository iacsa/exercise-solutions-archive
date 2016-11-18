use std::cmp;

pub struct Triangle {
  a: u32,
  b: u32,
  c: u32
}

impl Triangle {

  pub fn build(sides: [u32; 3]) -> Result<Self, &'static str> {
    let a = sides[0];
    let b = sides[1];
    let c = sides[2];
    let max = cmp::max(cmp::max(a, b), c);
    if a <= 0 || b <= 0 || c <= 0 {
      Err("Side lengths must be positive.")
    } else if a + b + c < 2 * max {
      Err("One side must not be longer than the other two.")
    } else {
      Ok(Triangle{ a: a, b: b, c: c })
    }
  }

  pub fn is_equilateral(&self) -> bool {
    self.a == self.b && self.b == self.c
  }
  pub fn is_scalene(&self) -> bool {
    self.a != self.b && self.b != self.c && self.c != self.a
  }
  pub fn is_isosceles(&self) -> bool {
    !(self.is_equilateral() || self.is_scalene())
  }
}
