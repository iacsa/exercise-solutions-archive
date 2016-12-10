module Raindrops
  private SOUNDS = [
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
  ]

  def self.drops(n)
    sounds = SOUNDS.map do |(k, s)|
      n % k == 0 ? s : ""
    end.join

    sounds.size > 0 ? sounds : n.to_s
  end
end
