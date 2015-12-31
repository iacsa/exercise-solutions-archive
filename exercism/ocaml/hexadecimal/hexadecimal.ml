open Core.Std

let is_valid (number: string) : bool =
  let valid_chars = String.to_list "0123456789abcdef"
  in
  number |> String.to_list
         |> List.for_all ~f:(List.mem valid_chars)

let to_int (number: string) : int =
  if is_valid number then
    number |> String.to_list
           |> List.fold ~init:0 ~f:(fun acc x ->
               acc * 16 + match x with
               | 'a' | 'b' | 'c'
               | 'd' | 'e' | 'f' -> Char.to_int x + 10 - Char.to_int 'a'
               | _ -> Char.to_int x - Char.to_int '0'
           )
  else 0
