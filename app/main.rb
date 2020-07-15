# frozen_string_literal: true

require_relative 'lib/args_parser'

parser = ArgsParser.new(ARGV)
parser.register = [
  # The register is like next line
  # ['-f', 1, method(:prueba)]
  # for call a function can utilize method(:name-of-function)
  # in case for call a method in a class, utilize NameOfClass.method(:name-of-method)
]

parser.apexecute
