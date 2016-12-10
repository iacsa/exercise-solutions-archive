module React

  alias Cell = InputCell | ComputeCell
  alias CellData = Int32

  class InputCell
    @listeners = Array(ComputeCell).new

    def initialize(@value : CellData)
    end

    protected getter listeners
    getter value

    def value=(value)
      if value != @value
        @value = value
        @listeners.each(&.update)
        @listeners.each(&.fire)
      end
    end
  end

  class ComputeCell
    @listeners = Array(ComputeCell).new
    @old_value : CellData
    @value : CellData
    @refresh : -> CellData
    @callbacks = Hash(Int32, (CellData -> )).new

    def initialize(input1 : Cell, &block : CellData -> CellData)
      @refresh = ->() {block.call(input1.value)}
      @old_value = @value = @refresh.call
      input1.listeners << self
    end
    def initialize(input1 : Cell, input2 : Cell, &block : (CellData, CellData) -> CellData)
      @refresh = ->() {block.call(input1.value, input2.value)}
      @old_value = @value = @refresh.call
      input1.listeners << self
      input2.listeners << self
    end

    protected getter listeners
    getter value

    def add_callback(&block : CellData -> )
      new_id = (@callbacks.keys + [-1]).max + 1
      @callbacks[new_id] = block
      new_id
    end

    def remove_callback(id)
      @callbacks.delete(id)
    end

    def update
      value = @refresh.call
      if value != @value
        @value = value
        @listeners.each(&.update)
      end
    end

    def fire
      if @old_value != @value
        @callbacks.values.each do |cb|
          cb.call(@value)
        end
        @listeners.each(&.fire)
        @old_value = @value
      end
    end
  end
end
