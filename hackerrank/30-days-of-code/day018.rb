class Palindrome
  def initialize
    @stack = []
    @queue = []
  end

  def pushCharacter(c)
    @stack.push(c)
  end

  def enqueueCharacter(c)
    @queue.unshift(c)
  end

  def popCharacter
    @stack.pop()
  end

  def dequeueCharacter
    @queue.pop()
  end
end
