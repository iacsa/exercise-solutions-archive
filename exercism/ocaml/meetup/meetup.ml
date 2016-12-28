open Core.Std


type schedule
    = First
    | Second
    | Third
    | Fourth
    | Teenth
    | Last


type weekday
    = Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday


type date = (int * int * int)


let is_leap_year year =
  year mod 400 = 0 || year mod 4 = 0 && year mod 100 > 0

let month_length ~year = function
  | 2 -> if is_leap_year year then 29 else 28
  | 4 -> 30
  | 6 -> 30
  | 9 -> 30
  | 11 -> 30
  | _ -> 31


let convert_weekday = function
  | Day_of_week.Mon -> Monday
  | Day_of_week.Tue -> Tuesday
  | Day_of_week.Wed -> Wednesday
  | Day_of_week.Thu -> Thursday
  | Day_of_week.Fri -> Friday
  | Day_of_week.Sat -> Saturday
  | Day_of_week.Sun -> Sunday


let day_of_week (year, month, day) =
  Date.create_exn ~y:year ~m:(Month.of_int_exn month) ~d:day
    |> Date.day_of_week
    |> convert_weekday


let meetup_day schedule wday ~year ~month =
  let scheduled_one =
    match schedule with
    | First  -> (Fn.flip List.nth_exn) 0
    | Second -> (Fn.flip List.nth_exn) 1
    | Third  -> (Fn.flip List.nth_exn) 2
    | Fourth -> (Fn.flip List.nth_exn) 3
    | Teenth -> List.find_exn ~f:(fun (_, _, day) -> day > 12)
    | Last   -> List.last_exn in
  List.range ~stop:`inclusive 1 (month_length ~year month)
    |> List.map ~f:(fun day -> (year, month, day))
    |> List.filter ~f:(fun date -> wday = day_of_week date)
    |> scheduled_one
