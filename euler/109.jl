# Darts ...

singles = [[1:20], 25]
doubles = [[1:20] * 2 , 50]
triples = [1:20] * 3

fields = sort([singles, doubles, triples])

function checkouts (togo)
  count = 0
  len = length(fields)
  for double in doubles
    x = togo - double
    if x == 0
      count += 1
      break;
    end
    if x < 0 ; continue ; end
    for i in 1:len
      if x < fields[i] ; break ; end
      if fields[i] == x
        count += 1
      end
      for j in i:len
        if fields[i] + fields[j] == x
          count += 1
        end
      end
    end
  end
  count
end

x = 0
for i in 1:99
  x += checkouts(i)
end
println(x)
