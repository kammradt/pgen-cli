# frozen_string_literal: true

require './password_generator'
require 'optparse'

def parse_optional_bool_flag(flag)
  # `flag.nil?` verifies if the input is just `-X` (considered true).
  # If -X has an argument, convert it to bool

  flag.nil? || flag.to_s == 'true'
end

options = {
  length: 12,
  numbers_only: false,
  include_special_chars: true
}

OptionParser.new do |parser|
  parser.on('-l LENGTH', '--length LENGTH', 'Password length as integer. Default: 12. Ex pgen -l 32', Integer)

  parser.on('-p [PIN]', '--pin [PIN]',
            'Should use a pin password (numbers only). Default: false. Ex: pgen -p | pass
 -p true | pgen -p false') do |pin|
    options[:numbers_only] = parse_optional_bool_flag pin
  end

  parser.on('-s [SPECIAL]', '--special [SPECIAL]',
            'Should use special characters (!?;). Default: true. Ex: pgen -p, command -p true, command -p false') do |special|
    options[:include_special_chars] = parse_optional_bool_flag special
  end
end.parse!(into: options)

puts PasswordGenerator.new.generate options
