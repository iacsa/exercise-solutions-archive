let tile_combinations n =
  let rec tc a b c d = function
    | 0 -> a
    | n -> tc b c d (a + b + c + d) (n - 1)
  in
  tc 1 1 2 4 n

let () =
  let num_of_tiles = 50 in
  print_endline @@ string_of_int @@ tile_combinations num_of_tiles
