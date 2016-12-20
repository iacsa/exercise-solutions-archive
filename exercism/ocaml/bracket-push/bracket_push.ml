open Core.Std

let are_balanced (expr: string) : bool =
  let rec aux stack chars =
    match stack, chars with
    | ss, [] -> ss = []
    | ss, c :: cs when List.mem ['('; '['; '{'] c -> aux (c :: ss) cs
    | '(' :: ss, ')' :: cs -> aux ss cs
    | '[' :: ss, ']' :: cs -> aux ss cs
    | '{' :: ss, '}' :: cs -> aux ss cs
    | _, c :: _ when List.mem [')'; ']'; '}'] c -> false
    | ss, _ :: cs -> aux ss cs
  in
    aux [] (String.to_list expr)
