open Core.Std

type base = int

let convert_bases ~from ~digits ~target =
  if from <= 1 || target <= 1 || digits = [] then None
  else let rec to_base acc value =
         if value = 0 then acc
         else to_base (value mod target :: acc) (value / target)
       and from_base acc digit =
         if digit < 0 || from <= digit then None
         else Option.map acc ~f:(fun a -> a * from + digit) in
       let value = List.fold ~init:(Some 0) ~f:from_base digits in
       Option.map value ~f:(function 0 -> [0] | v -> to_base [] v)
