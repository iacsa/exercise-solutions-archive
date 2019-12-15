let test a b c = a * a + b * b = c * c

let find_c a b =
  let c = 1000 - a - b in
  if test a b c then Some (a, b, c)
  else None

let rec find_bc a b =
  if a + b >= 1000 then None
  else
    let rec_c = find_c a b in
    match rec_c with
    | Some v -> Some v
    | None -> find_bc a (b + 1)

let rec find_abc a =
  if a >= 1000 then None
  else
    let rec_bc = find_bc a 1 in
    match rec_bc with
    | Some v -> Some v
    | None -> find_abc (a + 1)

let () =
  match find_abc 1 with
  | Some (a, b, c) -> print_endline (string_of_int (a * b * c))
  | None -> ()
