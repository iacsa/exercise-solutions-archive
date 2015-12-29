module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

yearRelativeToEarth :: Planet -> Double
yearRelativeToEarth Earth   = 1.0
yearRelativeToEarth Mercury = 0.2408467
yearRelativeToEarth Venus   = 0.61519726
yearRelativeToEarth Mars    = 1.8808158
yearRelativeToEarth Jupiter = 11.862615
yearRelativeToEarth Saturn  = 29.447498
yearRelativeToEarth Uranus  = 84.016846
yearRelativeToEarth Neptune = 164.79132

ageOn :: Planet -> Double -> Double
ageOn planet seconds = seconds / (secondsInYear * yearRelativeToEarth planet)
  where secondsInYear = 60 * 60 * 24 * 365.25
