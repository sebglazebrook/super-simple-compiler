require "super_simple_compiler"

describe SuperSimpleCompiler do

  describe ".compile" do

    subject { described_class.compile(source_code) }

    context "when given a string of source code" do

      let(:source_code) { "1 + 3" }
      let(:tokens) { double("Tokens") }
      let(:syntax_tree) { double("SyntaxTree") }
      let(:semantically_correct_syntax_tree) { double("SemanticallyCorrectSyntaxTree") }
      let(:intermediate_code) { double("IntermediateCode") }
      let(:optimized_intermediate_code) { double("OptimizedIntermediateCode") }
      let(:assembly_code) { double("AssemblyCode") }

      before do
        allow(SuperSimpleCompiler::LexicalAnalyzer).to receive(:analyze).with(source_code).and_return(tokens)
        allow(SuperSimpleCompiler::SyntaxAnalyzer).to receive(:analyze).with(tokens).and_return(syntax_tree)
        allow(SuperSimpleCompiler::SemanticAnalyzer).to receive(:analyze).with(syntax_tree).and_return(semantically_correct_syntax_tree)
        allow(SuperSimpleCompiler::IntermediateCodeGenerator).to receive(:generate).with(semantically_correct_syntax_tree).and_return(intermediate_code)
        allow(SuperSimpleCompiler::IntermediateCodeOptimizer).to receive(:optimize).with(intermediate_code).and_return(optimized_intermediate_code)
        allow(SuperSimpleCompiler::AssemblyGenerator).to receive(:generate).and_return(assembly_code)
        allow(SuperSimpleCompiler::ExecutableGenerator).to receive(:generate).with(assembly_code)
      end

      it "converts the source code string into token" do
        expect(SuperSimpleCompiler::LexicalAnalyzer).to receive(:analyze).with(source_code).and_return(tokens)
        subject
      end

      it "converts the tokens into a syntax tree" do
        expect(SuperSimpleCompiler::SyntaxAnalyzer).to receive(:analyze).with(tokens).and_return(syntax_tree)
        subject
      end

      it "validates the syntax tree" do
        expect(SuperSimpleCompiler::SemanticAnalyzer).to receive(:analyze).with(syntax_tree).and_return(semantically_correct_syntax_tree)
        subject
      end

      it "converts the syntax tree to the language's low-level language" do
        expect(SuperSimpleCompiler::IntermediateCodeGenerator).to receive(:generate).with(semantically_correct_syntax_tree).and_return(intermediate_code)
        subject
      end

      it "optimizes the low-level language code" do
        expect(SuperSimpleCompiler::IntermediateCodeOptimizer).to receive(:optimize).with(intermediate_code).and_return(optimized_intermediate_code)
        subject
      end

      it "converts the optimized low-level languade code to assembly code" do
        expect(SuperSimpleCompiler::AssemblyGenerator).to receive(:generate).and_return(assembly_code)
        subject
      end

      it "generates a executable file from the assembly code" do
        expect(SuperSimpleCompiler::ExecutableGenerator).to receive(:generate).with(assembly_code)
        subject
      end
    end
  end
end
