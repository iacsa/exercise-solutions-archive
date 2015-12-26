(** list-ops exercise *)

(*
Please don't use any external modules (especially List) in your
implementation. The point of this exercise is to create these basic functions
yourself.

Note that `++` is a function from an external module (Pervasives, which is
automatically opened) and so shouldn't be used either.
*)

let rec fold ~init:acc ~f = function
  | [] -> acc
  | x :: xs -> fold ~init:(f acc x) ~f xs

let length xs = fold ~init:0 ~f:(fun a _ -> a + 1) xs

let reverse xs = fold ~init:[] ~f:(fun a x -> x :: a) xs

let map ~f xs = reverse (fold ~init:[] ~f:(fun a x -> (f x) :: a) xs)

let filter ~f xs =
  reverse (fold ~init:[] ~f:(fun a x -> if (f x) then (x :: a) else a) xs)

let append xs1 xs2 = fold ~init:xs2 ~f:(fun a x -> x :: a) (reverse xs1)

let concat xss = fold ~init:[] ~f:(fun a x -> append x a) (reverse xss)
