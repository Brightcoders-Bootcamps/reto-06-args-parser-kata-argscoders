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
    @arguments.each_with_index do |args, i|
      @register.each do |registro|
        if args == registro[0]
          apcallback(registro, @arguments[(i + 1)..(i + registro[1])])
          # registro[2].call
        end
      end
    end
  end

  private

  def apcallback(argv, args)
    # 0 = flag
    # 1 = no. de argumentos de funcion
    # 2 = callback

    case argv[1]
    when 0 then argv[2].call
    when 1 then argv[2].call(args[0])
    when 2 then argv[2].call(args[0], args[1])
    when 3 then argv[2].call(args[0], args[1], args[2])
    when 4 then argv[2].call(args[0], args[1], args[2], args[3])
    when 5 then argv[2].call(args[0], args[1], args[2], args[4], args[5])
    end
  end
end
