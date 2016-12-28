open Core.Std


let roman_digits : (string * int) list =
  [ ("M", 1000)
  ; ("CM", 900)
  ; ("D", 500)
  ; ("CD", 400)
  ; ("C", 100)
  ; ("XC", 90)
  ; ("L", 50)
  ; ("XL", 40)
  ; ("X", 10)
  ; ("IX", 9)
  ; ("V", 5)
  ; ("IV", 4)
  ; ("I", 1)
  ]


let repeat times str =
  List.init ~f:(fun _ -> str) times
    |> String.concat


let to_roman num =
  let aux (target, acc) (digit, value) =
    (target mod value , acc ^ repeat (target / value) digit)
  in
    roman_digits
      |> List.fold ~f:aux ~init:(num, "")
      |> Tuple2.get2
