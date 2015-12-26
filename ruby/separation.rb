IO.foreach(ARGV[0]){|line|
  words, numbers = [], []
  line.chomp.split(",").each{|token|
    (token =~ /[:alpha:]/ ? words : numbers) << token
  }
  puts [words, numbers].reject(&:empty?).map{|arr| arr.join(",")}.join("|")
}
