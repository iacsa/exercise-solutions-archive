import java.util.TreeMap

class School {

  private val grades = TreeMap<Int, MutableList<String>>()
  
  fun db(): Map<Int, List<String>> = grades

  fun add(name: String, grade: Int) {
    grades.getOrPut(grade, { -> arrayListOf() }).add(name)
  }

  fun sort(): Map<Int, List<String>> {
    return grades.mapValues { it.value.sorted() }
  }

  fun grade(grade: Int): List<String> {
    return grades[grade] ?: emptyList()
  }
}
