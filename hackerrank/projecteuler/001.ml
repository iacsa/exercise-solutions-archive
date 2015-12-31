let sum_to_n n = ((n * n) + n) / 2

let sum_of_multiples upper_limit =
  3 * sum_to_n (upper_limit / 3) +
  5 * sum_to_n (upper_limit / 5) -
  15 * sum_to_n (upper_limit / 15)

let number_of_cases = read_int ()

let () = for i = 1 to number_of_cases do
  let upper_limit = read_int ()
  in print_endline (string_of_int (sum_of_multiples (upper_limit - 1)))
done
