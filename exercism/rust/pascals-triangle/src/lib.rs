pub struct PascalsTriangle {
  row_data: Vec<Vec<u32>>
}

impl PascalsTriangle {
  pub fn new(row_count: u32) -> Self {

    if row_count == 0 { return PascalsTriangle{ row_data: Vec::new() } }

    let mut data: Vec<Vec<u32>> = vec![vec![1]];

    for i in 1 .. row_count {
      let mut new_row: Vec<u32> = vec![0; (i + 1) as usize];
      {
        let last_row = data.last().unwrap();
        for j in 0 .. last_row.len() {
          new_row[j] += last_row[j];
          new_row[j + 1] += last_row[j];
        }
      }
      data.push(new_row);
    }

    PascalsTriangle{ row_data: data }
  }

  pub fn rows(&self) -> Vec<Vec<u32>> {
    self.row_data.clone()
  }
}
