require "set"

class CustomSet < Set
  alias_method :set_subset?, :subset?
  alias_method :set_superset?, :superset?
  def put (element)
    add(element)
  end
  def empty
    clear
  end
  def subset? (other)
    set_superset?(other)
  end
  def superset? (other)
    set_subset?(other)
  end
end
