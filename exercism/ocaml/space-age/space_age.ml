open Core.Std

type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let seconds_in_earth_year: float = 365.25 *. 24.0 *. 60.0 *. 60.0

let relative_to_earth: planet -> float = function
  | Earth -> 1.0
  | Mercury -> 0.2408467
  | Venus -> 0.61519726
  | Mars -> 1.8808158
  | Jupiter -> 11.862615
  | Saturn -> 29.447498
  | Uranus -> 84.016846
  | Neptune -> 164.79132

let age_on (p: planet) (seconds: int) : float =
  float seconds /. seconds_in_earth_year /. relative_to_earth p
