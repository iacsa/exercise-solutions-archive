class Garden

  STUDENTS = [
    "alice", "bob", "charlie", "david",
    "eve", "fred", "ginny", "harriet",
    "ileana", "joseph", "kincaid", "larry"
  ]
  
  PLANTS = {
    'V' => :violets,
    'R' => :radishes,
    'G' => :grass,
    'C' => :clover
  }

  def initialize(garden, students = STUDENTS)
    @students = students.map(&:downcase).sort

    row1, row2 = garden.split.map do |row|
      row.chars.each_slice(2)
    end

    @plants = row1.zip(row2).map do |parcel|
      parcel.flatten.map{|cell| PLANTS[cell] }
    end
  end

  def method_missing(name, *args, &block)
    super unless index = @students.index(name.to_s)
    @plants[index]
  end  
end
