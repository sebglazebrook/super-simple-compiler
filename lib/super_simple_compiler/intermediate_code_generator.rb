require "super_simple_compiler/tokens/addition"

module SuperSimpleCompiler
  class IntermediateCodeGenerator

    def self.generate(syntax_tree)
      case syntax_tree.token
      when SuperSimpleCompiler::Tokens::Addition
        "add(#{syntax_tree.left.token.value}, #{syntax_tree.right.token.value})"
      else
        raise "Don't know how to handle #{}"
      end
    end

  end
end
