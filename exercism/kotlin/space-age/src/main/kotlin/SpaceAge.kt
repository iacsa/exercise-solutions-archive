class SpaceAge(val seconds: Long) {

  // Note: Don't do any rounding, that's just stupid

  private fun age(factor: Double) = seconds / 31557600.0 / factor
  fun onEarth() = age(1.0)
  fun onMercury() = age(0.240847)
  fun onVenus() = age(0.61519726)
  fun onMars() = age(1.8808158)
  fun onJupiter() = age(11.862615)
  fun onSaturn() = age(29.447498)
  fun onUranus() = age(84.016846)
  fun onNeptune() = age(164.79132)
}
