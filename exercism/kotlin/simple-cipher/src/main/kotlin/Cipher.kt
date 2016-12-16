import java.util.Random

operator fun Char.plus(other: Char): Int = this.toInt() + other.toInt()

class Cipher(val key: String) {
  constructor() : this(Array(100, { 'a' + Random().nextInt(26) }).joinToString("")) {}

  init {
    if (key.isEmpty() || key.any { it !in 'a' .. 'z' })
      throw IllegalArgumentException("Illegal cipher key.")
  }

  fun encode(text: String): String {
    var key_index: Int = 0
    return text.map {
      'a' + (it.toLowerCase() + key[key_index++ % key.length] - 194) % 26
    }.joinToString("")
  }

  fun decode(cipher: String): String {
    var key_index: Int = 0
    return cipher.map {
      'a' + (it.toLowerCase() - key[key_index++ % key.length] + 26) % 26
    }.joinToString("")
  }
}
