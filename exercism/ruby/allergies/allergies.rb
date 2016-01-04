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
    "cats",
  ]

  def initialize(score)
    scores = score.to_s(2).reverse
    @list = Allergens.select.with_index do |allergen, idx|
      scores[idx] == "1"
    end
  end

  def allergic_to?(allergen)
    @list.include?(allergen)
  end
end
