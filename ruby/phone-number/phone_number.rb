=begin
class PhoneNumber
  ErrorCode = "0000000000"
  attr_reader :number

  def initialize (str)
    if /[a-zA-Z]/ =~ str
      @number = ErrorCode
    else
      str = str.gsub(/[^0-9]/, "")
      if str.size == 10 || str.size == 11 && str[0] == "1"
        @number = str[-10 .. -1]
      else
        @number = ErrorCode
      end
    end
  end
  def area_code
    @number[0...3]
  end
  def to_s
    "(#{@number[0..2]}) #{@number[3..5]}-#{@number[6..9]}"
  end
end
=end

class PhoneNumber

  VERSION = 2

  ERROR_NUMBER = '0000000000'

  def initialize(number)
    @number = number
  end

  def area_code
    number[0..2]
  end

  def number
    @number.gsub!(/[\(\)-\.\s]+/, '')
    bad_number? ? ERROR_NUMBER : format_number
  end

  def to_s
    '(' + area_code + ')' + ' ' + number[3..5] + '-' + number[6..-1]
  end

  private

  def bad_number?
    improper_length? || leading_number_invalid? || has_letters?
  end

  def format_number
    @number = @number[-10 .. -1]
  end

  def has_letters?
    @number.match(/[a-zA-Z]+/)
  end

  def improper_length?
    ![10,11].include?(@number.length)
  end

  def leading_number_invalid?
    @number.chars.first != '1' && @number.length == 11
  end

end
