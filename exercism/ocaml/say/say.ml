open Core.Std
open Int64


let word_map =
  Map.of_alist_exn
    [ (1L, "one")
    ; (2L, "two")
    ; (3L, "three")
    ; (4L, "four")
    ; (5L, "five")
    ; (6L, "six")
    ; (7L, "seven")
    ; (8L, "eight")
    ; (9L, "nine")
    ; (10L, "ten")
    ; (11L, "eleven")
    ; (12L, "twelve")
    ; (13L, "thirteen")
    ; (14L, "fourteen")
    ; (15L, "fifteen")
    ; (16L, "sixteen")
    ; (17L, "seventeen")
    ; (18L, "eighteen")
    ; (19L, "nineteen")
    ; (20L, "twenty")
    ; (30L, "thirty")
    ; (40L, "forty")
    ; (50L, "fifty")
    ; (60L, "sixty")
    ; (70L, "seventy")
    ; (80L, "eighty")
    ; (90L, "ninety")
    ]


let say_num =
  Map.find word_map


let suffixes =
  [ ""
  ; " thousand"
  ; " million"
  ; " billion"
  ; " trillion"
  ]


let rec chunk value =
  if value = 0L then
    []
  else
    (rem value 1000L) :: chunk (value / 1000L)


let join_with (s1: string option) (s2: string option) ~sep:(sep: string) =
  Option.first_some
    (Option.map2 ~f:(fun s1 s2 -> s1 ^ sep ^ s2) s1 s2)
    (Option.first_some s1 s2)


let say_hundreds value =
  let tens = (rem value 100L) / 10L
  and ones = rem value 10L in
  let hundreds_string =
    say_num (value / 100L)
      |> Option.map ~f:(fun s -> s ^ " hundred") in
  let tens_string =
    Option.first_some
      (say_num (10L * tens + ones))
      (join_with (say_num (10L * tens)) (say_num ones) ~sep:"-") in
  join_with hundreds_string tens_string ~sep:" "


let say_chunk (value, suffix) =
  Option.map ~f:(fun text -> text ^ suffix) (say_hundreds value)


let in_english (number: int64) : string option =
  if number < 0L || number >= 1_000_000_000_000L then
    None
  else if number = 0L then
    Some "zero"
  else
    let chunks = (chunk number) in
    List.zip_exn chunks (List.take suffixes (List.length chunks))
      |> List.rev_filter_map ~f:say_chunk
      |> String.concat ~sep:" "
      |> Some
