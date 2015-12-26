class Allergies
  attr_reader :list

  Allergens = [
    "eggs",
    "peanuts",
    "shellfish",
    "strawberries",
    "tomatoes",
    "chocolate",
    "pollen",
    "cats"
  ]

  def initialize (score)
    @lookup = Hash[*Allergens.zip(score.to_s(2).reverse.chars).flatten]
    @list = Allergens.select{|allergen| allergic_to?(allergen)}
  end
  def allergic_to? (allergen)
    @lookup[allergen] == "1"
  end
end
