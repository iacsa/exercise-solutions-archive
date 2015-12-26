open Core.Std

let increment_map map key =
  Int.Map.change map key (fun x -> Some (Option.value x ~default:0 + 1))

let counts (board: string list) : int Int.Map.t =
  let h = List.length board
  in
  List.foldi board ~init:Int.Map.empty ~f:(fun y map row ->
    row |> String.to_list
        |> List.filter_mapi ~f:(fun i -> function '*' -> Some i | _ -> None)
        |> List.fold ~init:map ~f:(fun map x ->
            List.fold [-1; 0; 1] ~init:map ~f:(fun map dx ->
              List.fold [-1; 0; 1] ~init:map ~f:(fun map dy ->
                increment_map map ((x + dx) * (h + 2) + y + dy)))))


let annotate (board: string list) : string list =
  let h = List.length board
  and cs = counts board
  in
  List.mapi board ~f:(fun y row ->
    row |> String.to_list
        |> List.mapi ~f:(fun x c ->
            match c, Int.Map.find cs (x * (h + 2) + y) with
            | '*', _ -> '*'
            | _, None -> ' '
            | _, Some(n) -> (Int.to_string n).[0])
        |> String.of_char_list)
