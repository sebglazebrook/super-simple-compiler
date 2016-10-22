module SuperSimpleCompiler
  module Ast
    class Node

      attr_reader :token, :left, :right

      def initialize(token, left = nil, right = nil)
        @token = token
        @left = Node.new(left) if left
        @right = Node.new(right) if right
      end

      def ==(other)
        self.token == other.token &&
          self.left == other.left &&
          self.right == other.right
      end

    end
  end
end
