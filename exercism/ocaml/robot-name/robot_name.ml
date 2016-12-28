open Core.Std


exception PossibleRobotsExhausted


let unused_ids =
  let ids = Array.init ~f:Fn.id (26 * 26 * 1000) in
  Array.permute ids;
  ref (Array.to_list ids)


let next_id () =
  match !unused_ids with
  | id :: rest ->
      unused_ids := rest;
      id
  | [] ->
      raise PossibleRobotsExhausted


type robot =
  < get_name : unit -> string
  ; reset : unit -> unit
  >


let char_of value =
  Char.of_int_exn (Char.to_int 'A' + value)


let new_robot () =
  object
    val mutable id = next_id ()

    method get_name () =
      let digits = id % 1000
      and first_letter = char_of (id / 26000)
      and second_letter = char_of (id / 1000 % 26) in
      sprintf "%c%c%03d" first_letter second_letter digits

    method reset () =
      id <- next_id ()
  end


let name robot =
  robot#get_name ()


let reset robot =
  robot#reset ()
