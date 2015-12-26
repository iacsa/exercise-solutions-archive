open Core.Std
open Int64

let factors_of : int64 -> int64 list =
  let rec aux (p: int64) (acc: int64 list) : int64 -> int64 list = function
    | 1L -> acc
    | n when rem n p = 0L -> aux p (p :: acc) (n / p)
    | n -> aux (p + 1L) acc n
  in
  Fn.compose List.rev (aux 2L [])
