open Core.Std

let bottles : int -> string = function
  | 0 -> "No more bottles of beer"
  | 1 -> "1 bottle of beer"
  | n -> string_of_int n ^ " bottles of beer"

let middle : int -> string = function
  | 0 -> ".\nGo to the store and buy some more, "
  | 1 -> ".\nTake it down and pass it around, "
  | n -> ".\nTake one down and pass it around, "

let verse (n: int) : string =
  let before = bottles n
  and after = bottles ((n + 99) mod 100)
  in
  String.concat [
    before;
    " on the wall, ";
    String.lowercase (before);
    middle n;
    String.lowercase (after);
    " on the wall.\n"
  ]

let rec sing ~from:(n: int) ~until:(m: int) : string =
  verse n ^ "\n" ^ (if n <= m then "" else sing ~from:(n - 1) ~until:m)
