require "super_simple_compiler/lexical_analyzer"
require "super_simple_compiler/syntax_analyzer"
require "super_simple_compiler/semantic_analyzer"
require "super_simple_compiler/intermediate_code_generator"
require "super_simple_compiler/intermediate_code_optimizer"
require "super_simple_compiler/assembly_generator"
require "super_simple_compiler/executable_generator"

module SuperSimpleCompiler

  def self.compile(source_code)
    tokens = LexicalAnalyzer.analyze(source_code)
    syntax_tree = SyntaxAnalyzer.analyze(tokens)
    semantically_correct_syntax_tree = SemanticAnalyzer.analyze(syntax_tree)
    intermediate_code = IntermediateCodeGenerator.generate(semantically_correct_syntax_tree)
    optimized_code = IntermediateCodeOptimizer.optimize(intermediate_code)
    assembly_code = AssemblyGenerator.generate(optimized_code)
    ExecutableGenerator.generate(assembly_code)
  end

end
