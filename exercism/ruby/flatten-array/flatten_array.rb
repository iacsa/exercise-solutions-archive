module FlattenArray
  def self.flatten(array)
    array.flatten # Merge nested arrays into one
         .compact # Remove nil values
  end
end
