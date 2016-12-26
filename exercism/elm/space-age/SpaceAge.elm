module SpaceAge exposing (Planet (..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Int -> Float
ageOn planet seconds =
  let
    earthYears =
      toFloat seconds / (60 * 60 * 24 * 365.25)
    relativeToEarth =
      case planet of
        Earth   -> 1.0
        Mercury -> 0.2408467
        Venus   -> 0.61519726
        Mars    -> 1.8808158
        Jupiter -> 11.862615
        Saturn  -> 29.447498
        Uranus  -> 84.016846
        Neptune -> 164.79132
  in
    earthYears / relativeToEarth
