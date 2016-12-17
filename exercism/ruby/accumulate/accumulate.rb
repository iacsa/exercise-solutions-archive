module BookKeeping
  VERSION = 1
end

class Array
  def accumulate
    each.with_object([]) do |it, result|
      result << yield(it)
    end
  end
end
