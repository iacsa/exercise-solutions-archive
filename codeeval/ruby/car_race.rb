require 'enumerator'

def drive (car, track)
  id, max, acc, brk = car
  max = max # miles per second
  time, speed = 0.0, 0.0
  track.each_slice(2){|length, turn|
    turn = (180 - turn) / 180.0 * max
    acc_time = (max - speed) / max * acc
    acc_length = acc_time * (max + speed) / 7200
    brk_time = (max - turn) / max * brk
    brk_length = brk_time * (max + turn) / 7200
    mid_time = (length - acc_length - brk_length) / max * 3600
    time += acc_time + mid_time + brk_time
    speed = turn
  }
  [id, time]
end
track, cars = nil, []
IO.foreach(ARGV[0]){|line|
  if track then cars << drive(line.split.map(&:to_f), track)
  else track = line.split.map(&:to_f) end
}
cars.sort_by(&:last).each{|car| puts "%d %.2f" % car }
