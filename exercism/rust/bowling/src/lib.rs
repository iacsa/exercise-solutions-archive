pub struct BowlingGame {
  half_frames_completed: i32,
  score: i32,
  bonus_for_1: i32,
  bonus_for_2: i32,
  bonus_rolls: i32,
  pins_remaining: i32,
}

impl BowlingGame {

  pub fn new() -> Self {
    BowlingGame{
      half_frames_completed: 0,
      score: 0,
      bonus_for_1: 0,
      bonus_for_2: 0,
      bonus_rolls: 0,
      pins_remaining: 0,
    }
  }

  pub fn roll(&mut self, pins: i32) -> Result<(), &'static str> {

    if self.is_new_frame() {
      self.pins_remaining = 10;
    }

    if self.is_finished() {
      return Err("The game is already finished.");
    }

    if pins < 0 || self.pins_remaining < pins {
      return Err("Illegal number of pins rolled.");
    }

    self.pins_remaining -= pins;

    let strike = self.is_new_frame() && self.pins_remaining == 0;
    let spare = !strike && self.pins_remaining == 0;

    // A strike completes a full frame, every other roll is only a half
    self.half_frames_completed += if strike { 2 } else { 1 };
    if self.half_frames_completed > 20 {
      self.bonus_rolls -= 1;
    }

    self.score += pins * (1 + self.bonus_for_1 + self.bonus_for_2);

    // Whether rolling a spare or a strike gives the regular bonus
    let regular = self.half_frames_completed < 20;

    // 1 roll bonus if we had a 2 roll bonus before, or hit a spare now
    self.bonus_for_1 = self.bonus_for_2 + if spare && regular { 1 } else { 0 };

    // 2 roll bonus if we hit a strike
    self.bonus_for_2 = if strike && regular { 1 } else { 0 };

    // Grant bonus rolls for a strike or spare in the last frame
    if self.half_frames_completed == 20 {
      if strike { self.bonus_rolls = 2; }
      if spare { self.bonus_rolls = 1; }
    }

    Ok(())
  }

  pub fn score(&self) -> Result<i32, &'static str> {
    if self.is_finished() {
      Ok(self.score)
    } else {
      Err("Game is not finished yet")
    }
  }

  fn is_finished(&self) -> bool {
    self.half_frames_completed >= 20 && self.bonus_rolls == 0
  }

  fn is_new_frame(&self) -> bool {
    self.half_frames_completed % 2 == 0
  }
}
