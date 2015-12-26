open Core.Std
open Option

let increment_map map key =
  String.Map.change map key (fun x -> Some (Option.value x ~default:0 + 1))

let to_words text =
  text |> String.lowercase
       |> String.to_list
       |> List.map ~f:(function c when Char.is_alphanum c -> c | _ -> ' ')
       |> String.of_char_list
       |> String.split ~on:' '
       |> List.filter ~f:(fun s -> not (String.is_empty s))

let word_count text =
  List.fold (to_words text) ~init:String.Map.empty ~f:increment_map
