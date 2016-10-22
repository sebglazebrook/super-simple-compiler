require "super_simple_compiler/tokens/number"
require "super_simple_compiler/tokens/addition"

module SuperSimpleCompiler
  class LexicalAnalyzer

    def self.analyze(source_code)
      source_code.chars.inject([]) do |tokens, character|
        case character
        when " "
          # NOOP
        when "3"
          tokens << Tokens::Number.new(character)
        when "1"
          tokens << Tokens::Number.new(character)
        when  "+"
          tokens << Tokens::Addition.new
        end
        tokens
      end
    end

  end
end
