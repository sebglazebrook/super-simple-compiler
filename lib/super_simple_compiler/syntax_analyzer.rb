require "super_simple_compiler/ast/node"

module SuperSimpleCompiler
  class SyntaxAnalyzer

    def self.analyze(tokens)
      # TODO remove this hard coding
      Ast::Node.new(tokens[1], tokens[0], tokens[2])
    end

  end
end
