use std::slice::Iter;
use std::iter::FromIterator;

#[derive(Clone, Debug)]
pub struct CustomSet<T: PartialEq + Clone> {
  set: Vec<T>
}

impl<T: PartialEq + Clone> CustomSet<T> {

  pub fn new(contents: Vec<T>) -> Self {
    let mut set = CustomSet{ set: vec![] };
    for item in contents { set.add(item); }
    set
  }

  pub fn clear(&mut self) {
    self.set.clear()
  }

  pub fn contains(&self, item: &T) -> bool {
    self.set.contains(item)
  }

  pub fn len(&self) -> usize {
    self.set.len()
  }

  pub fn is_empty(&self) -> bool {
    self.set.is_empty()
  }

  pub fn remove(&mut self, item: &T) -> bool {
    if let Some(n) = self.find(item) {
        self.set.swap_remove(n);
        true
    } else { false }
  }

  pub fn find(&mut self, item: &T) -> Option<usize> {
    self.iter().enumerate().filter(|&(_, e)| e == item).map(|(i, _)| i).next()
  }

  pub fn add(&mut self, item: T) -> bool {
    let duplicate = self.contains(&item);
    if !duplicate { self.set.push(item) }
    !duplicate
  }

  pub fn difference(&self, other: &Self) -> Self {
    self.iter().filter(|e| !other.contains(e)).cloned().collect()
  }

  pub fn is_disjoint(&self, other: &Self) -> bool {
    !self.iter().any(|e| other.contains(e))
  }

  pub fn iter(&self) -> Iter<T> {
    self.set.iter()
  }

  pub fn intersection(&self, other: &Self) -> Self {
    self.iter().filter(|e| other.contains(e)).cloned().collect()
  }

  pub fn is_subset(&self, other: &Self) -> bool {
    self.iter().all(|e| other.contains(e))
  }

  pub fn is_superset(&self, other: &Self) -> bool {
    other.is_subset(&self)
  }

  pub fn union(&self, other: &Self) -> Self {
    self.iter().chain(other.iter()).cloned().collect()
  }
}

impl<T: PartialEq + Clone> PartialEq for CustomSet<T> {
  fn eq(&self, other: &CustomSet<T>) -> bool {
    self.is_subset(other) && other.is_subset(self)
  }
}

impl<T: PartialEq + Clone> FromIterator<T> for CustomSet<T> {
  fn from_iter<I>(it: I) -> Self where I: IntoIterator<Item=T> {
    CustomSet::new(Vec::from_iter(it))
  }
}
