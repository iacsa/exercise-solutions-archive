class School
  def initialize
    @students = Hash.new{|h, k| h[k] = []}
  end
  def add (v, k)
    @students[k] << v
    @students[k].sort!
  end
  def to_hash
    Hash[@students.sort]
  end
  def grade (k)
    @students[k]
  end
end
