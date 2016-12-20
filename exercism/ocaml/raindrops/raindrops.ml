open Core.Std

let sound_list : (int * string) list = [3, "Pling"; 5, "Plang"; 7, "Plong"]


let raindrop (n: int) : string =
  let make_sound (k, s) = if n mod k = 0 then Some s else None
  in match List.reduce ~f:(^) (List.filter_map ~f:make_sound sound_list) with
     | Some(sound) -> sound
     | None -> string_of_int n
