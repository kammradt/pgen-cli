# frozen_string_literal: true

class PasswordGenerator
  attr_accessor :available_chars

  def initialize
    self.available_chars = {
      lower_upper: ('a'..'z').to_a + ('A'..'Z').to_a,
      numbers: ('0'..'9').to_a,
      special_chars: ('!'..'/').to_a
    }
  end

  def generate(options)
    random_password options
  end

  private

  def get_available_chars(options)
    return available_chars[:numbers] if options[:numbers_only]

    regular_and_numbers = available_chars[:lower_upper] + available_chars[:numbers]
    return regular_and_numbers + available_chars[:special_chars] if options[:include_special_chars]

    regular_and_numbers
  end

  def random_password(options)
    password_length = options[:length]

    # Generates a possible range of chars N times the password length
    available_chars = get_available_chars(options) * password_length

    available_chars.shuffle.join[0...password_length]
  end
end
