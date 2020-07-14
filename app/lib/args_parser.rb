# This class is a parser for analize the flags inputs
# The flags 

class ArgsParser
    attr_reader :arguments
    def initialize arguments
      @arguments = arguments
      exit_value = nil
      arguments.each do |flag|
        case flag
        when '-h' then exit_value = my_help_menu
        when '--help' then exit_value = my_help_menu
        else
          exit_value = flag
        end
      end
      exit_value
    end
  
    def my_help_menu
      return 'This is only for test purpose'
    end
  end
  