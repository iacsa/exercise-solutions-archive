#[derive(Debug, PartialEq)]
pub enum Error { EmptyBuffer, FullBuffer }

pub struct CircularBuffer<T> {
  capacity: usize,
  buffer: Vec<Option<T>>,
  r_idx: usize, // read index
  w_idx: usize, // write index
}

impl<T> CircularBuffer<T> {
  pub fn new (capacity: usize) -> Self {
    let mut buffer = CircularBuffer::<T>{
      capacity: capacity,
      buffer: Vec::with_capacity(capacity),
      r_idx: 0,
      w_idx: 0
    };
    buffer.clear();
    buffer
  }
  pub fn read (&mut self) -> Result<T, Error> {
    if self.is_empty() { Err(Error::EmptyBuffer) }
    else {
      self.r_idx += 1;
      Ok(self.buffer.get_mut((self.r_idx - 1) % self.capacity).unwrap().take().unwrap())
    }
  }
  pub fn write (&mut self, item: T) -> Result<(), Error> {
    if self.is_full() { Err(Error::FullBuffer) }
    else { self.overwrite(item) }
  }
  pub fn overwrite (&mut self, item: T) -> Result<(), Error> {
    if self.is_full() { self.r_idx += 1; }
    *self.buffer.get_mut(self.w_idx % self.capacity).unwrap() = Some(item);
    self.w_idx += 1;
    Ok(())
  }
  pub fn clear (&mut self) {
    self.buffer.clear();
    for _ in 0 .. self.capacity { self.buffer.push(None); }
    self.w_idx = self.r_idx;
  }
  pub fn is_empty (&self) -> bool { self.r_idx == self.w_idx }
  pub fn is_full (&self) -> bool { self.r_idx + self.capacity == self.w_idx }
}
