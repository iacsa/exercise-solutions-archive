def insert(head, value)
  node = head
  new_node = Node.new(value, nil)
  return new_node if head.nil?
  until node.next.nil?
    node = node.next
  end
  node.next = new_node
  head    
end
