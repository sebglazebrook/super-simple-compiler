require "super_simple_compiler/lexical_analyzer"

describe SuperSimpleCompiler::LexicalAnalyzer do

  describe ".analyze" do

    Tokens = SuperSimpleCompiler::Tokens

    subject { described_class.analyze(source_code) }

    let(:source_code) { " 3 + 1   " }

    it "generates tokens for the source code string" do
      expect(subject).to eq([Tokens::Number.new("3"), Tokens::Addition.new, Tokens::Number.new("1")])
    end
  end
end
