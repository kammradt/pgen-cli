# frozen_string_literal: true

require 'optparse'

class Parser
  attr_accessor :options

  def initialize
    self.options = {
      length: 12,
      numbers_only: false,
      include_special_chars: true
    }
  end

  def parse
    OptionParser.new do |parser|
      parser.on('-l LENGTH', '--length LENGTH', 'Password length as integer. Default: 12. Ex pgen -l 32', Integer)

      parser.on('-p [PIN]', '--pin [PIN]',
                'Should use a pin password (numbers only). Default: false. Ex: pgen -p | pgen -p true | pgen -p false') do |pin|
        options[:numbers_only] = parse_optional_bool_flag pin
      end

      parser.on('-s [SPECIAL]', '--special [SPECIAL]',
                'Should use special characters (!?;). Default: true. Ex: pgen -p | pgen -p true | pgen -p false') do |special|
        options[:include_special_chars] = parse_optional_bool_flag special
      end
    end.parse!(into: options)

    options
  end

  private

  def parse_optional_bool_flag(flag)
    # `flag.nil?` verifies if the input is just `-X` (considered true).
    # If -X has an argument, convert it to bool

    flag.nil? || flag.to_s == 'true'
  end
end
