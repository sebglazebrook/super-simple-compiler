require "super_simple_compiler/syntax_analyzer"

describe SuperSimpleCompiler::SyntaxAnalyzer do

  describe ".analyze" do

    subject { described_class.analyze(tokens) }

    Tokens = SuperSimpleCompiler::Tokens

    let(:tokens) { [Tokens::Number.new("3"), Tokens::Addition.new, Tokens::Number.new("1")] }

    it "generates a syntax tree" do
      expected_syntax_tree = SuperSimpleCompiler::Ast::Node.new(Tokens::Addition.new, Tokens::Number.new("3"), Tokens::Number.new("1"))
      expect(subject).to eq(expected_syntax_tree)
    end
  end
end
