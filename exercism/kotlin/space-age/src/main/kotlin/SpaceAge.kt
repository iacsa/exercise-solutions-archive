class SpaceAge(val seconds: Long) {

  private fun age(factor: Double) : Double {
    val exact = seconds / 31557600.0 / factor
    // The bestest way to do rounding
    return java.lang.String.format("%.2f", exact).toDouble()
  }

  fun onEarth() = age(1.0)
  fun onMercury() = age(0.240847)
  fun onVenus() = age(0.61519726)
  fun onMars() = age(1.8808158)
  fun onJupiter() = age(11.862615)
  fun onSaturn() = age(29.447498)
  fun onUranus() = age(84.016846)
  fun onNeptune() = age(164.79132)
}
