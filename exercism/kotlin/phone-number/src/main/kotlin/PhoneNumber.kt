class PhoneNumber(val raw: String) {

  val number: String
    get

  init {
    val sanitized: String = raw.filter { it.isDigit() }
    if (sanitized.length == 10 ||
        sanitized.length == 11 && sanitized.startsWith("1")) {
      number = sanitized.takeLast(10)
    } else {
      number = "0000000000"
    }
  }

  val areaCode: String
    get() = number.take(3)

  override fun toString(): String {
    return "($areaCode) ${number.substring(3, 6)}-${number.substring(6, 10)}"
  }
}
