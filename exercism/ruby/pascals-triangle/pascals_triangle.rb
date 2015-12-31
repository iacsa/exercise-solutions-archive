class Triangle
  attr_reader :rows
  def initialize (n)
    @rows = (n-1).times.each_with_object([[1]]) do |k, rows|
      rows << ([0]+rows.last+[0]).each_cons(2).map{|p| p[0]+p[1]}
    end
  end
end
