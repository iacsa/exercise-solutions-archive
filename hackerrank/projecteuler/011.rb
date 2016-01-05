matrix = 20.times.map do |i|
  gets.split.map(&:to_i)
end

maximum = 0

(0 ... 20).to_a.repeated_permutation(2) do |i, j|

  if i <= 16 && j <= 16
    sum = (0 ... 4).map do |delta|
      matrix[i + delta][j + delta]
    end.reduce(1, :*)
    maximum = sum if sum > maximum
  end

  if i <= 16 && j >= 3
    sum = (0 ... 4).map do |delta|
      matrix[i + delta][j - delta]
    end.reduce(1, :*)
    maximum = sum if sum > maximum
  end

  if j <= 16
    sum = (0 ... 4).map do |delta|
      matrix[i][j + delta]
    end.reduce(1, :*)
    maximum = sum if sum > maximum
  end

  if i <= 16
    sum = (0 ... 4).map do |delta|
      matrix[i + delta][j]
    end.reduce(1, :*)
    maximum = sum if sum > maximum
  end
end

puts maximum
