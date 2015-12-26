IO.foreach(ARGV[0]){|line|
  n, grid = line.split(";")
  n, grid = n.to_i, grid.split(",").map(&:to_i)
  if grid.map{|i| i < 1 or n < i}.any?
    puts "False"
  else
    m = Math.sqrt(n).round
    rows = (0...n).collect{|i|
      (0...n).collect{|j| grid[j + n * i]}.uniq.size == n
    }.all?
    cols = (0...n).collect{|i|
      (0...n).collect{|j| grid[i + n * j]}.uniq.size == n
    }.all?
    blocks = (0...m).collect_concat{|i|
      (0...m).collect{|j|
        base = (i + j * n) * m
        (0...m).collect_concat{|k|
          (0...m).collect{|l| grid[base + k + l * n]}
        }.uniq.size == n
      }
    }.all?
    if rows and cols and blocks
      puts "True"
    else
      puts "False"
    end
  end
}
