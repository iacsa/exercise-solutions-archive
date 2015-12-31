class Element
  attr_accessor :prv, :nxt, :val

  def initialize (val, nxt)
    @nxt = nxt || self and @prv = @nxt.prv || self
    @val, @nxt.prv, @prv.nxt = val, self, self
  end

  def remove
    unless @nxt == self
      @nxt.prv, @prv.nxt = @prv, @nxt
      @nxt
    end
  end
end

class Deque
  def push value
    @head = Element.new(value, @head)
    self
  end

  def pop
    value, @head = @head.val, @head.remove
    value
  end

  def shift
    @head = @head.prv
    pop
  end

  def unshift value
    push(value)
    @head = @head.nxt
    self
  end
end
