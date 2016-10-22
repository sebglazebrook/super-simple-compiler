module SuperSimpleCompiler
  module Tokens
    class Number

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def ==(other)
        self.value == other.value
      end

    end
  end
end
