require "super_simple_compiler/intermediate_code_generator"
require "super_simple_compiler/tokens/addition"
require "super_simple_compiler/tokens/number"

module  SuperSimpleCompiler
  describe IntermediateCodeGenerator do

    describe ".generate" do

      subject { described_class.generate(syntax_tree) }

      context "when the root node is an Additon token" do

        let(:syntax_tree) do
          Ast::Node.new(
            Tokens::Addition.new,
            Tokens::Number.new(1),
            Tokens::Number.new(5)
          )

        end

        it "creates an addition statement" do
          expect(subject).to eq "add(1, 5)"
        end
      end
    end
  end
end
