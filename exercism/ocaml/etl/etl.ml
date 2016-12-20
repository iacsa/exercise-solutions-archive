open Core.Std

let transform (input: (int * char list) list) : (char * int) list =
  let transform_single (i, cs) = List.map ~f:(fun c -> (Char.lowercase c, i)) cs
  in List.concat_map ~f:transform_single input
  |> List.sort ~cmp:(fun (c1, _) (c2, _) -> compare c1 c2)
