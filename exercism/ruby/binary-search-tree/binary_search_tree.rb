class Bst
  include Enumerable

  attr_reader :data, :left, :right

  def initialize(val)
    @data = val
  end

  def insert(val)
    if val <= @data
      if @left.nil?
        @left = Bst.new(val)
      else
        @left.insert(val)
      end
    else
      if @right.nil?
        @right = Bst.new(val)
      else
        @right.insert(val)
      end
    end
  end

  def each 
    @left.each{|i| yield(i) } unless @left.nil?
    yield(@data)
    @right.each{|i| yield(i) } unless @right.nil?
  end
end
