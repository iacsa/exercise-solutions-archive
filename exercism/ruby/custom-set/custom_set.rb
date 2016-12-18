module BookKeeping
  VERSION = 1
end

require "set"

class CustomSet < Set
  def put (element)
    add(element)
  end
  def empty
    clear
  end
end
