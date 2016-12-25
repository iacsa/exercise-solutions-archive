module Raindrops exposing (raindrops)

sounds : List (Int, String)
sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

raindrops : Int -> String
raindrops n =
  let
    makes (divisor, sound) =
      if n % divisor == 0 then
        sound
      else
        ""
    soundsMade =
      sounds
        |> List.map makes
        |> String.concat
  in
    if String.isEmpty soundsMade then
      toString n
    else
      soundsMade
