def getHeight(root)
  if root.nil?
    0
  else
    1 + [getHeight(root.left), getHeight(root.right)].max
  end
end
