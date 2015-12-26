class CircularBuffer
  class BufferEmptyException < Exception
  end
  class BufferFullException  < Exception
  end

  def initialize (size)
    @size = size
    clear
  end
  def read
    raise BufferEmptyException if empty?
    value = @buffer[@read % @size]
    @buffer[@read % @size] = nil
    @read += 1
    value
  end
  def write (value)
    raise BufferFullException if !value.nil? && full?
    write!(value)
  end
  def write! (value)
    unless value.nil?
      @buffer[@write % @size] = value
      @read  += 1 if full?
      @write += 1
    end
  end
  def clear
    @buffer = Array.new(@size)
    @write, @read = 0, 0
  end
  def empty?
    @read == @write
  end
  def full?
    @read + @size == @write
  end
end
