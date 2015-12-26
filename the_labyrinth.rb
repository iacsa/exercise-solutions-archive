lab = File.open(ARGV[0]).map(&:chomp)
n, m = lab.size, lab[0].size
start = [0, lab[0].index(" ")]
finish = [n-1, lab[n-1].index(" ")]
lab[start.first][start.last] = "+"

def find_paths (pos, finish, n = 0)
  return if (pos.first - finish.first).abs + (pos.last - finish.last).abs + n >= $best
  if pos == finish
    $best = n
    $path = Marshal.load(Marshal.dump($lab))
    return
  end
  if $lab[pos.first][pos.last + 1] == " "
    $lab[pos.first][pos.last + 1] = "+"
    find_paths([pos.first, pos.last + 1], finish, n + 1)
    $lab[pos.first][pos.last + 1] = " "
  end
  if $lab[pos.first + 1][pos.last] == " "
    $lab[pos.first + 1][pos.last] = "+"
    find_paths([pos.first + 1, pos.last], finish, n + 1)
    $lab[pos.first + 1][pos.last] = " "
  end
  if pos.last > 0 and $lab[pos.first][pos.last - 1] == " "
    $lab[pos.first][pos.last - 1] = "+"
    find_paths([pos.first, pos.last - 1], finish, n + 1)
    $lab[pos.first][pos.last - 1] = " "
  end
  if pos.first > 0 and $lab[pos.first - 1][pos.last] == " "
    $lab[pos.first - 1][pos.last] = "+"
    find_paths([pos.first - 1, pos.last], finish, n + 1)
    $lab[pos.first - 1][pos.last] = " "
  end
end

$lab, $best, $path = lab, 999999999, nil
find_paths(start, finish)
puts $path
