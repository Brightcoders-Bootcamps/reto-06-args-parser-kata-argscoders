require_relative '../app/lib/args_parser'

def prueba saludate, goodbye
  "#{saludate}, #{goodbye}\n"
end

def prueba2
  print "Hola\n"
end

def function_raise
  raise 'error'
end

describe ArgsParser do
  describe "#apexecute" do
    it 'trying with a correct flag' do
      parser = ArgsParser.new(["-f", "hola", "mundo"])
      parser.register = [
        ["-f", 2, method(:prueba)]
      ]
      expect(parser.apexecute).to eq(["hola, mundo\n"])
    end

    it 'trying error with more arguments needed for the method' do
      parser = ArgsParser.new(["-f", "hola", "mundo", "3"])
      parser.register = [
        ["-f", 2, method(:prueba)]
      ]
      expect(parser.apexecute).to eq([true])
    end

    it 'trying error with more arguments that the needed for the method' do
      parser = ArgsParser.new(["-f", "hola", "mundo", "3"])
      parser.register = [
        ["-f", 2, method(:prueba)]
      ]
      expect(parser.apexecute).to eq([true])
    end
    it 'trying with two flags ' do
      parser = ArgsParser.new(["-f", "hola", "mundo", "-h"])
      parser.register = [
        ["-f", 2, method(:prueba)],
        ["-h", 0, method(:prueba2)]
      ]
      
      expect(parser.apexecute).to eq(["hola, mundo\n", nil])
    end
    it 'trying with two flags and less arguments needed for method' do
      parser = ArgsParser.new(["-f", "hola", "-h"])
      parser.register = [
        ["-f", 2, method(:prueba)]
      ]
      
      expect(parser.apexecute).to eq([true])
    end
    it 'trying with tree flags' do
      parser = ArgsParser.new(["-f", "hola", "mundo", "-h", "-r"])
      parser.register = [
        ["-f", 2, method(:prueba)],
        ["-h", 0, method(:prueba2)],
        ["-r", 0, method(:function_raise)]
      ]
      
      expect(parser.apexecute).to eq(["hola, mundo\n", nil, true])
    end
  end
end