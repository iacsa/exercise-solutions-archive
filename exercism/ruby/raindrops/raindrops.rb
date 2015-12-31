class Raindrops
  VERSION = 1
  SOUNDS = [["Pling", 3], ["Plang", 5], ["Plong", 7]]

  def Raindrops.convert (n)
    SOUNDS.select do |sound, divider|
      n.modulo(divider).zero?
    end.map(&:first).reduce(:+) || n.to_s
  end
end
