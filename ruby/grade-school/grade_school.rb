class School
  VERSION = 1
  def initialize
    @students = Hash.new{|h, k| h[k] = []}
  end
  def add (v, k)
    @students[k] << v
    @students[k].sort!
  end
  def to_h
    Hash[@students.sort]
  end
  def grade (k)
    @students[k]
  end
end
