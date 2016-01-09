open React
open Core.Std

type t = {
  word: string;
  mutable guessed: char list;
  mutable lives: int
}

type progress = Win | Lose | Busy of int

let create (word: string) : t =
  { word = word; guessed = []; lives = 9 }

let feed (guess: char) (game: t) : unit =
  if not (String.contains game.word guess) || (List.mem game.guessed guess)
  then game.lives <- game.lives - 1;
  game.guessed <- guess :: game.guessed

let masked_word (game: t) : string signal =
  game.word |> String.map ~f:(function
    | c when List.mem game.guessed c -> c
    | _ -> '_'
  ) |> S.const

let progress (game: t) : progress signal =
  if String.for_all game.word ~f:(List.mem game.guessed) then S.const Win
  else if game.lives < 0 then S.const Lose
  else S.const (Busy game.lives)
