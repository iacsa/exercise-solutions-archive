coins = [0, 1, 2, 1, 2, 1, 2, 3, 2, 3, 2, 3, 4, 3, 4]
File.open(ARGV[0]).map(&:to_i).each{|n|
  puts 3 * (n / 15) + coins[n % 15]
}
