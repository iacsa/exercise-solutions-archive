module Forth
  alias Value = Int32;
  alias Result = Array(Value)
  alias Stop = Nil
  alias Word = String
  alias Atom = Value | Word
  alias Token = Value | Word | Array(Token) | Stop

  def self.evaluate(code : String) : Result
    Interpreter.new.evaluate(code)
  end

  private class Interpreter
    @stack = [] of Value
    @definitions = {} of Word => Array(Token)

    def evaluate(input : String) : Result
      words = input.downcase.scan(/[:;]|[^\s[:cntrl:]]+/).map{|m| m[0]}
      tokens = parse(words.each, [] of Token)
      execute_all(tokens)
      @stack
    end

    def parse(words : Iterator(String), tokens : Array(Token))
      case word = words.next
      when ":" then tokens.push(parse(words, [] of Token))
      when ";" then return tokens.push(nil)
      when Iterator::Stop then return tokens
      else tokens.push(to_atom(word))
      end
      parse(words, tokens)
    end

    def to_atom(word : String) : Atom
      begin
        word.to_i32
      rescue
        word
      end
    end

    def execute_all(tokens : Array(Token))
      tokens.each{|token| execute(token)}
    end

    def execute(token : Token)
      case token
      when Array(Token) then add_definition(token)
      when Value then @stack.push(token)
      when Stop then raise "Erroneous semicolon."
      when Word then call(token)
      end
    end

    def call(name : Word)
      if @definitions.has_key?(name)
        tokens = @definitions[name]
        execute_all(tokens)
      else
        call_primitive(name)
      end
    end

    def call_primitive(name : Word)
      case name
      when "+" then apply(->(x : Value, y : Value) {[y + x]})
      when "-" then apply(->(x : Value, y : Value) {[y - x]})
      when "*" then apply(->(x : Value, y : Value) {[y * x]})
      when "/" then apply(->(x : Value, y : Value) {[y / x]})
      when "swap" then apply(->(x : Value, y : Value) {[x, y]})
      when "over" then apply(->(x : Value, y : Value) {[y, x, y]})
      when "dup"  then apply(->(x : Value) {[x, x]})
      when "drop" then apply(->(x : Value) {[] of Value})
      else raise "Undefined word: [#{name}]"
      end
    end

    def add_definition(definition : Array(Token))
      name = definition.first
      body = definition[1 .. -2]
      stop = definition.last
      raise "Invalid name for function: [: #{name}]" unless name.is_a?(Word)
      raise "Missing semicolon: [: #{definition}]" unless stop.is_a?(Stop)
      @definitions[name] = body
    end

    def apply(f : (Value) -> Result)
      raise "Stack Underflow" if @stack.size < 1
      @stack += f.call(@stack.pop)
    end

    def apply(f : (Value, Value) -> Result)
      raise "Stack Underflow" if @stack.size < 2
      @stack += f.call(@stack.pop, @stack.pop)
    end
  end
end
