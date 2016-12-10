module RunLengthEncoding

  def self.decode(code)
    code.scan(/(\d*)(.)/).map do |match|
      match[2] * (match[1].empty? ? 1 : match[1].to_i)
    end.join
  end

  def self.encode(text)
    text.scan(/(.)\1*/).map do |match|
      count = match[0].size
        "#{count > 1 ? count : ""}#{match[1]}"
    end.join
  end
end
