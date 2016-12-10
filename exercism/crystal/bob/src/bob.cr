module Bob
  def self.hey(line)
    if /\A^\s*\Z/ =~ line
      "Fine. Be that way!"
    elsif /\A[^a-z]*[A-Z][^a-z]*\Z/ =~ line
      "Whoa, chill out!"
    elsif line.ends_with?("?")
      "Sure."
    else
      "Whatever."
    end
  end
end
