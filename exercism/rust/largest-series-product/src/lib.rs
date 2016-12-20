pub fn lsp(series: &str, span: usize) -> Result<u32, &'static str> {
  if span == 0 {
    return Ok(1)
  }
  if series.len() < span {
    return Err("Span value greather than series length.")
  }
  if !series.chars().all(|c| c.is_digit(10)) {
    return Err("Illegal characters in series.")
  }

  (0 .. series.len() - span + 1).map(|i| {
    series[i .. i + span].chars().map(|c| {
      c.to_digit(10).unwrap()
    }).fold(1, |a, b| a * b)
  }).max().ok_or_else(|| unreachable!())
}
