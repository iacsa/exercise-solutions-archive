# General outline of finding the farthest neighbors for each node:
#
# 1. Find the "center" node of the graph
#
# 2. All longest paths go through the center, so for node e1 the
#  find . -name '*~' -delete  farthest neighbors N(e1) must also be of maximum distance from the center

class City
  attr_accessor :neighbors, :farthest, :times_visited
  def initialize(id)
    @id = id
    @neighbors = []
    @farthest = []
    @max_distance = 0
    @times_visited = 0
  end
end

number_of_cities, number_of_trips = gets.split.map(&:to_i)

cities = Array.new(number_of_cities){|i| City.new(i) }

cities.each{|city| p city }

number_of_cities.pred.times do |line|
  city1, city2 = line.split.map(&:to_i)
