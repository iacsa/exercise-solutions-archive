open Core.Std

let is_valid (number: string) : bool =
  let valid_chars = "0123456789abcdef"
  in
  String.for_all number ~f:(String.contains valid_chars)

let to_int (number: string) : int =
  if is_valid number then
    String.fold number ~init:0 ~f:(fun acc x ->
      acc * 16 + match x with
      | 'a' | 'b' | 'c'
      | 'd' | 'e' | 'f' -> Char.to_int x + 10 - Char.to_int 'a'
      | _ -> Char.to_int x - Char.to_int '0'
    )
  else 0
