require 'optparse'

def get_available_chars(options)
  zero_to_nine_chars = ('0'..'9').to_a
  letter_chars = ('a'..'z').to_a + ('A'..'Z').to_a
  special_chars = ('!'..'/').to_a

  is_only_numeric = options[:pin]
  return zero_to_nine_chars if is_only_numeric

  should_use_special_chars = options[:special]
  return zero_to_nine_chars + letter_chars unless should_use_special_chars

  zero_to_nine_chars + letter_chars + special_chars
end

def random_password(options)
  password_length = options[:length]

  # Generates a possible range of chars N times the password length
  available_chars = get_available_chars(options) * password_length

  available_chars.shuffle.join[0...password_length]
end

def parse_optional_bool_flag(flag)
  # `flag.nil?` verifies if the input is just `-X` (considered true).
  # If -X has an argument, convert it to bool

  flag.nil? || flag.to_s == 'true'
end

options = {
  length: 12,
  special: true,
  is_only_numeric: false,
}

OptionParser.new do |parser|
  parser.on('-l LENGTH', '--length LENGTH', 'Password length as integer. Ex pgen -l 32', Integer)

  parser.on('-p [PIN]', '--pin [PIN]',
            'Indicate a pin password (numbers only). Ex: pgen -p') do |pin|
    options[:is_only_numeric] = pin
  end

  parser.on('-s [SPECIAL]', '--special [SPECIAL]',
            'Indicate to use or not special characters (!?;). Ex: pass -p, command -p true, command -p false') do |special|
    options[:special] = parse_optional_bool_flag special
  end
end.parse!(into: options)

puts random_password options

