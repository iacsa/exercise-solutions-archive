module BookKeeping
  VERSION = 1
end

class Scale
  attr_reader :pitches, :name

  ScaleSharp = %w{A A# B C C# D D# E F F# G G#}
  ScaleFlat = %w{A Bb B C Db D Eb E F Gb G Ab}
  Intervals = { "m" => 1, "M" => 2, "A" => 3 }

  def initialize (base, type, intervals = Array.new(12, "m").join)
    @name = "#{base.capitalize} #{type}"

    scale = case
    when %w{C D E F# G A B c# d# e f# g# a b}.member?(base)
      ScaleSharp
    when %w{Db Eb F Gb Ab Bb c d eb f g bb}.member?(base)
      ScaleFlat
    end.dup
    scale.rotate!(scale.index(base.capitalize))

    @pitches = intervals.each_char.with_object([]) do |interval, pitches|
      pitches << scale.first
      scale.rotate!(Intervals[interval])
    end
  end
end
