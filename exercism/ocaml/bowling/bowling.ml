type t =
  < get_score : int
  ; roll : int -> unit
  >

class game = object(self)
  val mutable half_frames_completed = 0
  val mutable score = 0
  val mutable bonus_for_1 = 0
  val mutable bonus_for_2 = 0
  val mutable pins_remaining = 0

  method private is_new_frame =
    half_frames_completed mod 2 = 0

  method get_score =
    score

  method roll (pins_hit: int) =
    if self#is_new_frame then pins_remaining <- 10;
    pins_remaining <- pins_remaining - pins_hit;
    let strike = self#is_new_frame && pins_remaining = 0 in
    let spare = not strike && pins_remaining = 0 in
    half_frames_completed <- half_frames_completed + if strike then 2 else 1;
    score <- score + pins_hit * (1 + bonus_for_1 + bonus_for_2);
    let regular = half_frames_completed < 20 in
    bonus_for_1 <- bonus_for_2 + if spare && regular then 1 else 0;
    bonus_for_2 <- if strike && regular then 1 else 0;
end

(* Changed this signature to return new games every time it is called *)
let new_game () : t =
  new game

let roll (pins_hit: int) (game: t) : t =
  game#roll pins_hit; game

let score (game: t) : int =
  game#get_score
