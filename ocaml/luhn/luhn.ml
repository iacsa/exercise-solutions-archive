open Core.Std

let addends (number: string) : int list =
  number |> String.to_list
         |> List.rev
         |> List.map ~f:(fun d -> Char.to_int d - Char.to_int '0')
         |> List.mapi ~f:(fun i n -> (1 + i mod 2) * n)
         |> List.map ~f:(fun n -> n - 9 * (n / 10))

let checksum (number: string) : int =
  List.sum (module Int) (addends number) ~f:Fn.id

let valid (number: string) : bool =
  0 = checksum number mod 10
