# frozen_string_literal: true

require_relative '../app/lib/args_parser'
require_relative 'helper_functions'

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
        ["-f", 2, method(:prueba)],
        ['-h', 0, method(:prueba2)]
      ]
      
      expect(parser.apexecute).to eq([true, nil])
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
    
    it 'trying with negative numbers' do
      parser = ArgsParser.new(['-s', '3', '-3'])
      parser.register = [['-s', 2, method(:suma)]]
      expect(parser.apexecute).to eq([0])
    end

    it 'trying arrays' do
      parser = ArgsParser.new(['-s', '1,2,3,4'])
      parser.register = [['-s', 1, method(:suma_a)]]
      expect(parser.apexecute).to eq([10])
    end

    it 'trying arrays with negative values' do
      parser = ArgsParser.new(['-p', '10,-1,-5,6'])
      parser.register = [['-p', 1, method(:suma_a)]]
      expect(parser.apexecute).to eq([10])
    end
  end
end
