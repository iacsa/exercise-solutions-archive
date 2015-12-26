class Garden

  Students = [
    "alice", "bob", "charlie", "david",
    "eve", "fred", "ginny", "harriet",
    "ileana", "joseph", "kincaid", "larry"
  ]
  
  Plants = {
    'V' => :violets,
    'R' => :radishes,
    'G' => :grass,
    'C' => :clover
  }

  def initialize (garden, students = Students)
    @students = students.map(&:downcase).sort
    @plants = garden.split.map do |row|
      row.chars.each_slice(2).to_a
    end.transpose.map(&:flatten).map do |parcel|
      parcel.map do |cell|
        Plants[cell]
      end
    end
  end

  def method_missing(name, *args, &block)
    super unless index = @students.index(name.to_s)
    @plants[index]
  end  
end
