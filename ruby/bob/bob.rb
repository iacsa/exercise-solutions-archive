class Bob
  def hey (line)
    if /\A^\s*\Z/ =~ line then "Fine. Be that way!"
    elsif /\A[^a-z]*[A-Z][^a-z]*\Z/ =~ line then "Whoa, chill out!"
    elsif line.end_with?("?") then "Sure."
    else "Whatever."
    end
  end
end
