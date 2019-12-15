module Acronym
  def self.abbreviate(phrase)
    # We want to include in the abbreviation:
    # 1. Any capital letter not immediately preceded by another capital letter
    # 2. Any lowercase letter not immediately preceded by any other letter
    phrase.scan(/((?<![A-Z])[A-Z]|(?<![a-zA-Z])[a-z])/).join.upcase
  end
end
