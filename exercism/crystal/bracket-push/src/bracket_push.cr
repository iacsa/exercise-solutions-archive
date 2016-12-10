module Brackets
  private BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  def self.are_valid?(string)
    stack = Array(Char).new

    string.chars.each do |c|
      if BRACKETS.has_key?(c)
        stack.push(BRACKETS[c])
      elsif BRACKETS.has_value?(c) && (stack.empty? || stack.pop != c)
        return false
      end
    end

    stack.empty?
  end
end
