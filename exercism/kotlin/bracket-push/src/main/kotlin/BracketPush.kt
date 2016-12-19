fun<T> MutableList<T>.pop(): T? {
  try {
    return this.removeAt(this.lastIndex)
  } catch (e: ArrayIndexOutOfBoundsException) {
    return null
  }
}

object BracketPush {
  private val BRACKETS = mapOf('(' to ')', '[' to ']', '{' to '}')

  fun isValid(expr: String): Boolean {
    val stack: MutableList<Char> = mutableListOf()
    for (char in expr) {
      if (char in BRACKETS) {
        stack.add(BRACKETS[char]!!)
      } else if (BRACKETS.containsValue(char) && (stack.pop() != char)) {
        return false
      }
    }
    return stack.isEmpty()
  }
}
