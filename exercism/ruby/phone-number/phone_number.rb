class PhoneNumber

  ErrorCode = "0000000000"

  attr_reader :number

  def initialize(str)

    # Default value if given number is not valid
    @number = ErrorCode

    # Only digits and a few other characters allowed
    return unless /^[[:digit:]\(\)\.\- ]+$/ =~ str

    # Extract only digits of the given string
    str = str.gsub(/[^[:digit:]]/, "")

    # Only accept number if it is valid
    if str.size == 10 || str.size == 11 && str.start_with?("1")
      @number = str[-10 .. -1]
    end
  end

  def area_code
    @number[0 .. 2]
  end

  def to_s
    "(#{@number[0 .. 2]}) #{@number[3 .. 5]}-#{@number[6 .. 9]}"
  end
end
