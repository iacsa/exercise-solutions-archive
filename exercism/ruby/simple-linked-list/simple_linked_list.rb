class SimpleLinkedList
  include Enumerable
  attr_reader :head
  alias_method :size, :count
  alias_method :peek, :first

  def initialize
    @head = Element::EMPTY
  end
  
  def each
    element = @head
    until element == Element::EMPTY
      yield element.datum
      element = element.next
    end
  end

  def self.from_a(arr)
    return new if arr.nil?
    arr.reverse_each.with_object(new) { |datum, list| list.push(datum) }
  end

  def push(datum)
    @head = Element.new(datum, @head)
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def empty?
    size.zero?
  end

  def pop
    result = @head.datum
    @head = @head.next
    result
  end
end

class Element
  # We don't want the last element / empty list to actually be nil, because we
  # like useful error messages.
  EMPTY = self.new
  EMPTY.define_singleton_method(:nil?){ true }

  attr_reader :datum, :next

  def initialize(d, n = nil)
    @datum = d
    @next = n || EMPTY
  end

  def tail?
    @next == EMPTY
  end
end
