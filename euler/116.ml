let rec tile_combinations num_of_tiles size_of_color_tile =
  if num_of_tiles < size_of_color_tile then 1
  else
    (tile_combinations (num_of_tiles - 1) size_of_color_tile) + (* Black Tile *)
    (tile_combinations (num_of_tiles - size_of_color_tile) size_of_color_tile) (* Color Tile *)

let () =
  let num_of_tiles = 50 in
  print_endline @@ string_of_int @@ (
    (tile_combinations num_of_tiles 2) + 
    (tile_combinations num_of_tiles 3) + 
    (tile_combinations num_of_tiles 4) - 3)
