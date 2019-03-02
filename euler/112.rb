def decreasing? (x)
  x.to_s.chars.map(&:to_i).each_cons(2).map{|a, b| a >= b}.all?
end

def increasing? (x)
  x.to_s.chars.map(&:to_i).each_cons(2).map{|a, b| a <= b}.all?
end

def bouncy? (x)
  not (decreasing?(x) or increasing?(x))
end

N = 22909000
bouncy = 0

(1..N).each do |n|
  bouncy += 1 if bouncy?(n)
  if bouncy * 100 == n * 99
    puts n
    break
  end
end
