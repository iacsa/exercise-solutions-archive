open Core.Std

let are_balanced (expr: string) : bool = with_return (fun r ->
  let reduce = function
    | stack, c when List.mem ['('; '['; '{'] c -> (c :: stack)
    | '(' :: stack, ')'
    | '[' :: stack, ']'
    | '{' :: stack, '}' -> stack
    | _, c when List.mem [')'; ']'; '}'] c -> r.return false
    | stack, _ -> stack
  in
    [] = List.fold ~f:(Tuple2.curry reduce) ~init:[] (String.to_list expr)
)
