def removeDuplicates(head)
  node = head
  until node.nil?
    if node.next && node.next.data == node.data
      node.next = node.next.next
    else
      node = node.next
    end
  end
  head
end
