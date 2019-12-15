require 'pp'
require 'set'
require 'benchmark'

def primes n
  prime = Array.new(n, true)
  (2...n).select{|i| (2..(n/i)).each{|j| prime[i*j] = false} if prime[i] ; prime[i]}
end

def digits n
  dgts = [n%10]
  while n > 0
    n /= 10
    dgts << n%10
  end
  dgts
#  dgts.sort
end

def reverse_and_add n
  number, reverse = n, 0
  while n > 0
    reverse *= 10
    reverse += n%10
    n /= 10
  end
  number + reverse
end

def palindrom? n
  str = n.to_s
  (0..(str.size/2)).map{|i| str[i]==str[str.size-1-i]}.all?
end

def concat n, m
  (n.to_s + m.to_s).to_i
end

def perms n
  n.to_s.chars.permutation.map{|i| i.inject(:+).to_i}.uniq.select{|i| i > n}
end

def all_concats list
  list.map{|i|
    list.select{|j| j != i}.map{|j|
      concat(i, j)
    }
  }.flatten
end

def is_integer? x
  x == x.floor
end
def is_positive_integer? x
  x > 0 and x.finite? and x == x.floor
end
def longest_consecutive list
  (1..list.size).map{|i|
    list[i-1] - i == 0
  }.count(true)
end

def scalar_product x0, x1, y0, y1
  x0 * y0 + x1 * y1
end
def right_triangle? x0, x1, y0, y1
  return false if (x0 == 0 and x1 == 0) or (y0 == 0 and y1 == 0)
  return false if x0 == y0 and x1 == y1
  scalar_product(x0, x1, y0, y1) == 0 or
  scalar_product(x0, x1, y0-x0, y1-x1) == 0 or
  scalar_product(y0, y1, y0-x0, y1-x1) == 0
end
