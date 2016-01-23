def levelOrder(root)
  to_visit = [root]
  until to_visit.empty?
    current = to_visit.shift
    to_visit.push(current.left) unless current.left.nil?
    to_visit.push(current.right) unless current.right.nil?
    print "#{current.data} "
  end
end
