class ETL
  def ETL.transform (old_scorebook)
    old_scorebook.each_with_object(Hash.new) do |(score, letters), scorebook|
      letters.each{|letter| scorebook[letter.downcase] = score }
    end
  end
end
