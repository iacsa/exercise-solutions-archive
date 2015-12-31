Lookup = {}
def lcs (a, b)
  if Lookup.has_key?(a + ";" + b)
    Lookup[a+";"+b]
  else
    val = if a.size == 0 or b.size == 0
            ""
          elsif a[-1] == b[-1]
            lcs(a[0, a.size - 1], b[0, b.size - 1]) + a[-1]
          else
            ss1 = lcs(a[0, a.size], b[0, b.size - 1])
            ss2 = lcs(a[0, a.size - 1], b[0, b.size])
            (ss1.size > ss2.size ? ss1 : ss2)
          end
    Lookup[a+";"+b] = val
    val
  end
end

IO.foreach(ARGV[0]){|line|
  if line.count(";") > 0
    a, b = line.chomp.split(";")
    puts lcs(a, b)
  end
}
