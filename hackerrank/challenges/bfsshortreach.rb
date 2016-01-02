test_count = gets.to_i
test_count.times do
  node_count, edge_count = gets.split.map(&:to_i)
  neighbors = Array.new(node_count){ [] }

  edge_count.times do |i|
    n1, n2 = gets.split.map(&:to_i)
    neighbors[n1 - 1] << (n2 - 1)
    neighbors[n2 - 1] << (n1 - 1)
  end

  start = gets.to_i - 1

  distance = Array.new(node_count, -1)
  visited = Array.new(node_count, false)

  fringe = [start]
  depth = 0

  until fringe.empty?
    new_fringe = []

    fringe.each do |node|
      next if visited[node]

      distance[node] = depth * 6
      visited[node] = true

      new_fringe += neighbors[node]
    end

    depth += 1
    fringe = new_fringe
  end

  (0 ... node_count).each do |i|
    print "#{distance[i]} " unless i == start
  end
  puts
end
