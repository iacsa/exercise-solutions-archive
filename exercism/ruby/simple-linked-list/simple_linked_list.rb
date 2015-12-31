class Element
  include Enumerable

  # We don't want the last element / empty list to actually be nil, because we
  # need it to have a #reverse method. So we use this singleton Element instead.
  # Object.new also works, but makes error messages less informative.
  EMPTY = self.new
  EMPTY.define_singleton_method(:nil?){ true }
  EMPTY.define_singleton_method(:to_a){ [] }
  EMPTY.define_singleton_method(:reverse){ self }
  EMPTY.define_singleton_method(:each){ }

  attr_reader :datum, :next
  def initialize(d, n)
    @datum = d
    @next = n || EMPTY
  end
  def self.to_a(e)
    e.to_a
  end
  def self.from_a(values)
    from_enum_reversed(values).reverse
  end
  def reverse
    self.class.from_enum_reversed(self)
  end
  def each
    yield datum
    self.next.each{|e| yield e }
  end

  private
    def self.from_enum_reversed(enum)
      enum.inject(EMPTY){|head, value| new(value, head) }
    end
end
