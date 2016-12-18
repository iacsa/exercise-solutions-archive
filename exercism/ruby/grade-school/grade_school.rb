module BookKeeping
  VERSION = 3
end

class School
  def initialize
    @students = Hash.new{ |h, k| h[k] = [] }
  end
  def add(student, grade)
    @students[grade] << student
  end
  def students(grade)
    @students[grade].sort
  end
  def students_by_grade
    @students.keys.sort.map do |grade| 
      { grade: grade, students: students(grade) }
    end
  end
end
