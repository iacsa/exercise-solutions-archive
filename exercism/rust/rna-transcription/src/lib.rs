#[derive(Debug, PartialEq)]
pub struct RibonucleicAcid {
  strain: String
}

#[derive(Debug, PartialEq)]
pub struct DeoxyribonucleicAcid {
  strain: String
}

impl RibonucleicAcid {
  pub fn new (strain: &str) -> Self {
    RibonucleicAcid {strain: strain.to_string()}
  }
  pub fn as_ref (&self) -> &str {
    &self.strain[..]
  }
}

impl DeoxyribonucleicAcid {
  pub fn new (strain: &str) -> Self {
    DeoxyribonucleicAcid {strain: strain.to_string()}
  }
  pub fn as_ref (&self) -> &str {
    &self.strain[..]
  }
  pub fn to_rna (&self) -> RibonucleicAcid {
    let rna: String = self.strain.chars().map(|c|
      match c {
        'C' => 'G',
        'G' => 'C',
        'A' => 'U',
        'T' => 'A',
         x  =>  x
      }
    ).collect();
    RibonucleicAcid::new(&rna[..])
  }
}
