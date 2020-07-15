# frozen_string_literal: true

# This class is a parser for analize the flags inputs
# The flags
class ArgsParser
  attr_reader :arguments
  attr_accessor :register

  def initialize(arguments)
    @arguments = arguments
  end

  def apexecute
    return_value = Array.new()
    @arguments.each_with_index do |args, i|
      @register.each do |registro|
        if args == registro[0]
          return_value << apcallback(registro, @arguments[(i + 1)..(i + registro[1])])
        end
      end
    end
    return_value
  end

  private

  def apcallback(argv, args)
    # 0 = flag
    # 1 = no. de argumentos de funcion
    # 2 = callback
    begin
      return (args.length == argv[1]) ? argv[2].call(*args) : true
    rescue
      return true
    end
  end
end
