open React
open Core.Std

type t = {
  word: char list;
  mutable guessed: char list;
  mutable lives: int
}

type progress = Win | Lose | Busy of int

let create (word: string) : t =
  { word = String.to_list word; guessed = []; lives = 9 }

let feed (guess: char) (game: t) : unit =
  if not (List.mem game.word guess) || (List.mem game.guessed guess)
  then game.lives <- game.lives - 1;
  game.guessed <- guess :: game.guessed

let masked_word (game: t) : string signal =
  game.word |> List.map ~f:(function
    | c when List.mem game.guessed c -> c
    | _ -> '_'
  )         |> String.of_char_list
            |> S.const

let progress (game: t) : progress signal =
  if List.for_all game.word ~f:(List.mem game.guessed) then S.const Win
  else if game.lives < 0 then S.const Lose
  else S.const (Busy game.lives)
