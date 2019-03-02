let rec tile_combinations num_of_tiles =
  if num_of_tiles < 3 then 1
  else
    (tile_combinations (num_of_tiles - 1)) + (* Black Tile *)
    (tile_combinations_red num_of_tiles 3) (* Red Tiles *)
  and tile_combinations_red num_of_tiles size_of_red_tile =
    if size_of_red_tile == num_of_tiles then 1
    else
      (tile_combinations (num_of_tiles - size_of_red_tile - 1)) +
      (tile_combinations_red num_of_tiles (size_of_red_tile + 1))

let () = print_endline @@ string_of_int @@ tile_combinations 10
