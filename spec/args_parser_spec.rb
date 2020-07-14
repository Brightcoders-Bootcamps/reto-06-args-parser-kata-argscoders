require_relative '../app/lib/args_parser'

describe ArgsParser do
  describe "#help" do
    it 'call flag for help' do
      expect(ArgsParser.new(["-h"])).to match "This is only for test purpose"
    end
    it 'trying with error flag' do
      expect(ArgsParser.new(["-f"])).not_to eq("This is only for test purpose")
    end
  end
end
