open Core.Std
open Option

let increment_map map key =
  String.Map.change map key ~f:(fun x -> Some (Option.value x ~default:0 + 1))

let rec to_words : char list -> string list = function
  | [] -> []
  | c :: s when Char.is_alphanum c -> word [c] s
  | _ :: s -> to_words s
and word (w : char list) : char list -> string list = function
  | [] -> [String.of_char_list w]
  | c1 :: c2 :: s when c1 =  '\'' && Char.is_alphanum c2 -> word (w @ [c1; c2]) s
  | c :: s when Char.is_alphanum c -> word (w @ [c]) s
  | _ :: s -> String.of_char_list w :: to_words s

let word_count text =
  let words = to_words (String.to_list (String.lowercase text)) in
  List.fold words ~init:String.Map.empty ~f:increment_map
