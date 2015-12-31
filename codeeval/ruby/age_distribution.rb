IO.foreach(ARGV[0]).map(&:to_i).each{|age|
  puts case age
  when 0..2    then "Still in Mama's arms" 
  when 3..4    then "Preschool Maniac"
  when 5..11   then "Elementary school"
  when 12..14  then "Middle school"
  when 15..18  then "High school"
  when 19..22  then "College"
  when 23..65  then "Working for the man" 
  when 66..100 then "The Golden Years" 
  else "This program is for humans"
  end
}
