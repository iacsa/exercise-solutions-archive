require "matrix"

MOD = 10 ** 9

def mod_mat(mat)
  Matrix::build(mat.row_size) do |i, j|
    mat[i, j] % MOD
  end
end

def mod_exp(mat, n)
  case
  when n == 1
    mat
  when n.even?
    mod_exp(mod_mat(mat * mat), n / 2)
  else
    mod_mat(mod_exp(mat, n - 1) * mat)
  end
end

input_count = gets.to_i

input_count.times do
  a, b, c, d, e, f, g, h, n = gets.split.map(&:to_i)

  max_x = [a, f, g].max
  max_y = [b, c, e].max
  d_ind = max_x + max_y
  h_ind = d_ind + 2

  size = h_ind + 2

  y = Matrix::columns([Array.new(size) do |i|
    case i
    when d_ind, h_ind then 0
    when d_ind + 1 then d
    when h_ind + 1 then h
    else 1
    end
  end])

  mat = Matrix::build(size) do |i, j|
    case i
    when 0
      [a - 1, b - 1 + max_x, c - 1 + max_x, d_ind].count(j)
    when max_x
      [f - 1, g - 1, e - 1 + max_x, h_ind].count(j)
    when d_ind
      case j
      when d_ind then d
      when d_ind + 1 then 1
      else 0
      end
    when d_ind + 1 then i == j ? d : 0
    when h_ind
      case j
      when h_ind then h
      when h_ind + 1 then 1
      else 0
      end
    when h_ind + 1 then i == j ? h : 0
    else i == j + 1 ? 1 : 0
    end
  end

  result = mod_exp(mat, n + 1) * y

  puts "#{result[0,0] % MOD} #{result[max_x,0] % MOD}"
end
