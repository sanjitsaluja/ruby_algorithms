require_relative 'binary_search_tree'
module RubyAlgorithms
  module Search

    # AVLTree:
    #
    # Implementation of a AVL tree (an instance of a balanced BST)
    #
    #
    class AVLTree < BST

      def insert(key)
        node = nil
        if self.root
          node = AVLTreeNode.new(key)
          self.root.insert(node)
        else
          node = self.root = AVLTreeNode.new(key)
        end
        rebalance(node)
      end

      def delete(key)
      end

      private
      def rebalance(node)
        while node
          node.update_height
          if height(node.left) > height(node.right) + 1
            p "Node #{node.key} is unb #{height(node.left)} > #{height(node.right)}"
            if height(node.left.left) < height(node.left.right)
              rotate_left(node.left)
              rotate_right(node)
            else
              rotate_right(node)
            end
          elsif height(node.right) > height(node.left) + 1
            p "Node #{node.key} is unb #{height(node.left)} < #{height(node.right)}"
            if height(node.right.right) < height(node.right.left)
              rotate_right(node.right)
              rotate_left(node)
            else
              rotate_left(node)
            end
          end
          node = node.parent
        end
      end

      def height(node)
        node.height rescue -1
      end


      def rotate_right(x)
        p "rotate_right#{x.key}"
        y = x.left
        y.parent = x.parent
        if y.parent.nil? # or x == self.root
          self.root = y
        else
          if y.parent.left == x
            y.parent.left = y
          end
          if y.parent.right == x
            y.parent.right = y
          end
        end
        x.left = y.right
        x.left.parent = x if x.left
        y.right = x
        x.parent = y
        x.update_height
        y.update_height
      end

      def rotate_left(x)
        p "rotate_left#{x.key}"
        y = x.right
        y.parent = x.parent
        if y.parent.nil? # or x == self.root
          self.root = y
        else
          if y.parent.left == x
            y.parent.left = y
          end
          if y.parent.right == x
            y.parent.right = y
          end
        end
        x.right = y.left
        x.right.parent = x if x.right
        y.left = x
        x.parent = y
        x.update_height
        y.update_height
      end

    end

    # AVLTreeNode:
    #
    # Implementation of a node in the AVL search tree
    #
    class AVLTreeNode < BSTNode
      attr_accessor :height

      def initialize(key, parent = nil)
        super(key, parent)
        self.height = 0 # Empty nodes contribute -1 height
      end

      def update_height
        self.height = [(self.left.height rescue -1), (self.right.height rescue -1)].max + 1
      end

      # valid?:
      #
      # Check AVLTree invariant for the subtree
      #
      def valid?
        height_left = self.left.height rescue -1
        height_right = self.right.height rescue -1
        valid = (height_left - height_right).abs <= 1
        valid &&= self.left.valid? if self.left
        valid &&= self.right.valid? if self.right
        valid
      end

      # delete
      #
      # Delete the node
      #
      def delete
      end
    end

  end
end
