class Grade < Student

  def initialize(firstName, lastName, phone, score)
    super(firstName, lastName, phone)
    @score = score
  end

  def calculate
    case @score
    when 0 ... 40 then "D"
    when 40 ... 60 then "B"
    when 60 ... 75 then "A"
    when 75 ... 90 then "E"
    when 90 .. 100 then "O"
    end
  end
end
