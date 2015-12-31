Lookup = {}

def overlap_size (a, b)
  def overlap_size_front (a, b)
    a.index(b) ? b.size : overlap_size_front(a, b[1, b.size-1])
  end
  def overlap_size_back (a, b, c = "")
    a.index(b) ? b.size : overlap_size_back(a, b[0, b.size-1])
  end
  a.size < b.size ? overlap_size(b, a) : Lookup[a+";!;"+b] ||= [overlap_size_front(a, b), overlap_size_back(a, b)].max
end

def overlap (a, b)
  def overlap_front (a, b, c = "")
    a.index(b) ? [b.size, c+a] : overlap_front(a, b[1, b.size-1], c+b[0])
  end
  def overlap_back (a, b, c = "")
    a.index(b) ? [b.size, a+c] : overlap_back(a, b[0, b.size-1], b[-1]+c)
  end
  a.size < b.size ? overlap(b, a) : [overlap_front(a, b), overlap_back(a, b)].max_by(&:first)
end

IO.foreach(ARGV[0]){|line|
  fragments = line.chomp.split(/[;]/)
  frags = fragments.reject{|f| fragments.map{|g| f != g and g.index(f)}.any?}.each_with_index.collect{|f, i| [f, [i]]}
  overlaps = (0...frags.size).collect_concat{|i| (0...i).collect{|j| [overlap_size(frags[i][0], frags[j][0]), i, j]}}.sort!.reverse!
  overlaps.each{|o, a, b|
    unless frags[a].object_id == frags[b].object_id
      fa, fb = frags[a], frags[b]
      olp = overlap(fa[0], fb[0])
      new = [olp[1], fa[1] | fb[1]]
      new[1].each{|i| frags[i] = new} if olp[0] >= o
    end
  }
  puts frags.first.first
}
