open Core.Std

(** Extract the digits from a valid phone number. *)
let number (str: string) : string option =
  let clean = str |> String.to_list
                  |> List.filter ~f:Char.is_digit
                  |> String.of_char_list
  in
  match String.length clean with
  | 10 -> Some clean
  | 11 when clean.[0] = '1' -> Some (String.drop_prefix clean 1)
  | _ -> None

(** Extract the area code from a valid phone number. *)
let area_code (str: string) : string option =
  Option.map (number str) ~f:(fun n -> String.slice n 0 3)


(** Pretty print a valid phone number. *)
let pretty (str: string) : string option =
  Option.map (number str) ~f:(fun n ->
    String.concat [
      "(";
      String.slice n 0 3;
      ") ";
      String.slice n 3 6;
      "-";
      String.slice n 6 10
    ])
