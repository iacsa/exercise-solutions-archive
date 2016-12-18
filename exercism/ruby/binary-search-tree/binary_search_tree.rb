class Bst
  include Enumerable

  VERSION = 1

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
    if block_given?
      @left.each{ |i| yield(i) } unless @left.nil?
      yield(@data)
      @right.each{ |i| yield(i) } unless @right.nil?
    else
      to_enum
    end
  end
end
