open Core.Std

let sound_list : (int * string) list = [3, "Pling"; 5, "Plang"; 7, "Plong"]


let raindrop (n: int) : string =
  let make_sound (k, s) = if n mod k = 0 then Some s else None in
  sound_list
    |> List.filter_map ~f:make_sound
    |> List.reduce ~f:(^)
    |> Option.value ~default:(Int.to_string n)
