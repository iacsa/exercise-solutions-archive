class Allergies(val mask: Int) {

  fun isAllergicTo(allergen: Allergen): Boolean =
    (mask.and(allergen.score)) > 0

  fun getList(): List<Allergen> =
    Allergen.values().filter { isAllergicTo(it) }
}
