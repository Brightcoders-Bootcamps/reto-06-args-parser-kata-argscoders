# frozen_string_literal: true

# This class is a parser for analize the flags inputs
# The flags
class ArgsParser
  attr_reader :arguments
  attr_writer :register

  def initialize(arg)
    @arguments = arg
  end

  def apexecute
    return_value = Array.new()
    parser.each do |args|
      reg = get_register(args[0])
      return_value << apcallback(reg, args[1..args.length])
    end
    return_value
  end

  def parser 
    ran_in, return_value, num_elements = 0, Array.new, @arguments.length
    for i in 0...num_elements
      if get_register(@arguments[i])
        (i == 0) ? next : return_value << @arguments[ran_in...i]
        ran_in = i
      end
    end
    return_value << @arguments[ran_in...num_elements]
  end

  private

  def get_register(test_value)
    @register.each do |reg|
      if reg[0] == test_value
        return reg
      end
    end
    false
  end

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
