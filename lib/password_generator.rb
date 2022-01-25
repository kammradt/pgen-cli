# frozen_string_literal: true

require_relative 'password_generator/version'
require 'generator'
require 'parser'

module PasswordGenerator
  class Error < StandardError; end

  def self.handle
    Generator.new.generate(Parser.new.parse)
  end
end
