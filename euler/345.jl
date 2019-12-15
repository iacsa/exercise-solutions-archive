

matrix = readdlm("345.txt", ';')

function max_sum(matrix, col, rows_taken)
  if col < 7
    println(col)
  end
  update = function(acc, i)
    indices, matrix_sum = max_sum(matrix, col + 1, [i rows_taken])
    if matrix_sum + matrix[i, col] > acc[2]
      (indices, matrix_sum + matrix[i, col], i)
    else
      acc
    end
  end

  if col > size(matrix)[2]
    return ([0], 0)
  else
    rows = filter(row -> !(row in rows_taken), 1 : size(matrix)[1])
    best = foldl(update, ([-1], -1, -1), rows)
    return [best[3] best[1]], best[2]
  end
end


print(max_sum(matrix, 1, [0]))
