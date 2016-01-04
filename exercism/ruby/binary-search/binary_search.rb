class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list.each_cons(2).all?{|i, j| i <= j }
    @list = list
  end

  def middle
    @list.size / 2
  end

  def search_for(value, low = 0, high = @list.size - 1)
    raise RuntimeError if low > high

    pivot = (high + low) / 2

    case value <=> @list[pivot]
    when -1 then search_for(value, low, pivot - 1)
    when  0 then pivot
    when  1 then search_for(value, pivot + 1, high)
    end
  end
end
