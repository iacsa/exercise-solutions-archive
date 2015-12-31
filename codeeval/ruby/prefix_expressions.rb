require 'pp'
IO.foreach(ARGV[0]){|line|
  stack = []
  line.split.each{|token|
    if ["*", "+", "/"].member?(token)
      stack << token.to_sym
    else
      stack << token.to_f
      while not stack[-2].instance_of?(Symbol) and stack[-3].instance_of?(Symbol)
        a = stack.pop; b = stack.pop; op = stack.pop.to_proc
        stack << op.call(b, a)
      end
    end
  }
  puts stack[0].round
}
