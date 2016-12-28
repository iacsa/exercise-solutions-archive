open Core.Std


let sanitize text =
  text
    |> String.filter ~f:Char.is_alphanum
    |> String.lowercase


let translate c =
  if Char.is_lowercase c then
    219 - Char.to_int c |> Char.of_int_exn
  else
    c


let chunk ~size text =
  text
    |> String.to_list
    |> List.groupi ~break:(fun i _ _ -> i % size = 0)
    |> List.map ~f:String.of_char_list
    |> String.concat ~sep:" "



let decode text =
  text
    |> sanitize
    |> String.map ~f:translate


let encode ?block_size:(size = 5) text =
  text
    |> decode
    |> chunk ~size
