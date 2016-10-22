module SuperSimpleCompiler
  module Tokens
    class Addition

      def ==(other)
        self.class == other.class
      end

    end
  end
end
