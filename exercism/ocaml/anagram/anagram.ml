(** Anagram exercise *)

(** Returns all candidates that are anagrams of, but not equal to, [base].

    Comparisons are case insensitive.

val anagrams : string -> string list -> string list
*)

open Core.Std

let sorted word =
  word |> String.to_list
       |> List.sort ~cmp:Char.compare
       |> String.of_char_list

let same_letters word candidate =
  sorted word = sorted candidate

let is_anagram word candidate =
  let w = String.lowercase word
  and c = String.lowercase candidate in
    w <> c && same_letters w c

let anagrams word candidates =
  List.filter candidates ~f:(is_anagram word)
