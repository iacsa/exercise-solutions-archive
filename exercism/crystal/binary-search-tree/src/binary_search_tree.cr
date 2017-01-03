class Node(T)

  include Enumerable(T)
  include Iterable(T)


  getter value : T
  getter left : Node(T)?
  getter right : Node(T)?


  def initialize(@value)
  end


  def insert(to_insert)
    if to_insert <= @value
      @left = @left.try &.insert(to_insert) || Node(T).new(to_insert)
    elsif to_insert > @value
      @right = @right.try &.insert(to_insert) || Node(T).new(to_insert)
    end
    self
  end


  def search(target)
    if target == @value
      self
    elsif target < @value
      @left.try &.search(target)
    elsif target > @value
      @right.try &.search(target)
    end
  end


  def each
    NodeIterator(T).new(self)
  end


  def each
    each.each do |value|
      yield value
    end
  end


  def delete(to_delete)
    if to_delete == @value
      if @left.nil? && @right.nil?
        return nil
      elsif @left.nil?
		    copy(@right.not_nil!)
      elsif @right.nil?
        copy(@left.not_nil!)
      else
        @value = @right.not_nil!.min.tap { |v| delete(v) }
      end
    elsif to_delete < @value
      @left = @left.try &.delete(to_delete)
    elsif to_delete > @value
      @right = @right.try &.delete(to_delete)
    end
    self
  end


  private def copy(other)
    @value = other.value
    @right = other.right
    @left = other.left
  end


  private class NodeIterator(T)

    include Iterator(T)


    @root : Node(T)
    @current : Node(T)?


    def initialize(@root)
      @current = @root
      @node_stack = [] of Node(T)?
      @value_stack = [] of T
    end


    def next
      if @current.nil?
        if @node_stack.empty?
          return stop
        else
          @current = @node_stack.pop
          return @value_stack.pop
        end
      end

      until (current = @current).nil?
        @value_stack << current.value
        @node_stack << current.right
        @current = current.left
      end

      self.next
    end

  end
  
end
