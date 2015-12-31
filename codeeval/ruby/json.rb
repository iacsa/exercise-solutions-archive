require 'json'
IO.foreach(ARGV[0]){|line|
  puts JSON.parse(line)["menu"]["items"].select{|item|
    not item.nil? and item.has_key?("label")
  }.map{|l| l["id"]}.reduce(0, :+)
}
