# REAL FAKE
#
# Check whether credit card number are real. A card is real if the sum of its
# digits, when every second digit starting with the first is doubled, is
# divisible by ten.
#
# NOTICE: The problem actually incorrectly states "every third number".

IO.foreach(ARGV[0]) do |line|
  # Extract the number into an array of numerical digits
  number = line.gsub(/[^\d]/, "").split("").map(&:to_i)

  # Every second digit counts thrice, numbers are always 16 digits long
  0.step(15, 2){|i| number[i] *= 2 }

  checksum = number.reduce(:+)
  puts (checksum % 10 == 0 ? "Real" : "Fake")
end
