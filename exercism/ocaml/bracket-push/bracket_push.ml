open Core.Std
open Core
open Sys

exception UnmatchedClosingBracket

let are_balanced (expr: string) : bool =
  let reduce = function
    | stack, c when List.mem ['('; '['; '{'] c -> (c :: stack)
    | '(' :: stack, ')'
    | '[' :: stack, ']'
    | '{' :: stack, '}' -> stack
    | _, c when List.mem [')'; ']'; '}'] c -> raise UnmatchedClosingBracket
    | stack, _ -> stack
  in
    try [] = List.fold ~f:(Tuple2.curry reduce) ~init:[] (String.to_list expr)
    with UnmatchedClosingBracket -> false
