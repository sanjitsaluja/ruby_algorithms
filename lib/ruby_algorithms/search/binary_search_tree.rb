module RubyAlgorithms
  module Search

    # BST:
    #
    # Implementation of a binary search tree
    #
    class BST
      attr_accessor :root

      def insert(key)
        if self.root
          node = BSTNode.new(key)
          self.root.insert(node)
        else
          self.root = BSTNode.new(key, nil)
        end
      end

      def find(key)
        self.root.find(key) if self.root
      end

      def find_min
        self.root.find_min if self.root
      end

      # valid?:
      #
      # Check BST invariant
      #
      # ==== Examples
      #
      # BST: [1 <- 2 -> 3]
      # valid? => false
      #
      # BST: [3 -> 2 -> 1]
      # valid? => true
      #
      def valid?
        self.root == nil || self.root.valid?
      end

      def delete(key)
        node = find(key)
        if node == self.root
          # Create a fake root and make current root its child
          fake_root = BSTNode.new(nil, nil)
          fake_root.left = self.root
          self.root.parent = fake_root
          self.root = fake_root
          # Now delete the node
          node.delete
          # Setup root again
          self.root = self.root.left
          self.root.parent = nil if self.root
        else
          node.delete
        end
        node
      end

    end

    # BSTNode:
    #
    # Implementation of a node in a binary search tree
    #
    class BSTNode
      attr_accessor :key
      attr_accessor :left
      attr_accessor :right
      attr_accessor :parent

      def initialize(key, parent = nil)
        self.key = key
        self.parent = parent
      end

      # find:
      #
      # Find a key in this BST subtree
      #
      # ==== Attributes
      #
      # * +key+ - key to find in BST
      #
      # ==== Examples
      #
      # BST: [1 <- 2 -> 3]
      # find(1) => BSTNode
      # find(4) => nil
      #
      def find(key)
        iterator = self
        while iterator != nil
          if iterator.key > key
            iterator = iterator.left
          elsif iterator.key < key
            iterator = iterator.right
          else
            break
          end
        end
        iterator
      end

      # insert:
      #
      # Insert a key in this subtree
      #
      # ==== Attributes
      #
      # * +key+ - key to insert in BST
      #
      # ==== Examples
      #
      # BST: [1 <- 2 -> 3]
      # insert(BSTNode.new(5))
      #
      def insert(node)
        iterator = self
        key = node.key
        while iterator != nil
          if iterator.key > key
            unless iterator.left
              iterator.left = node
              node.parent = iterator
              break
            end
            iterator = iterator.left
          elsif iterator.key < key
            unless iterator.right
              iterator.right = node
              node.parent = iterator
              break
            end
            iterator = iterator.right
          else
            raise "Pedantic use only. Don't support duplicates"
          end
        end
        node
      end

      # find_min:
      #
      # Return min node in this subtree
      #
      # ==== Examples
      #
      # BST: [1 <- 2 -> 3]
      # find_min => Node(1)
      #
      def find_min
        iterator = self
        while (iterator.left != nil)
          iterator = iterator.left
        end
        iterator
      end

      # traverse_in_order:
      #
      # Perform in order traversal of this subtree
      #
      # ==== Attributes
      #
      # * +proc+ - proc to call with every node visit
      #
      # ==== Examples
      #
      # node.traverse_in_order do |visited_node\
      #   # .. use visited_node
      # end
      def traverse_in_order(&proc)
        self.left.traverse_in_order(&proc) if self.left
        proc.call(self)
        self.right.traverse_in_order(&proc) if self.right
      end

      # valid?:
      #
      # Check BST invariant for the subtree
      #
      # ==== Examples
      #
      # BST: [1 <- 2 -> 3]
      # valid? => true
      #
      # BST: [3 -> 2 -> 1]
      # valid? => false
      #
      def valid?
        valid = true
        unless self.left.nil?
          valid &&= self.key > self.left.key
          valid &&= self.left.valid?
        end

        unless self.right.nil?
          valid &&= self.key < self.right.key
          valid &&= self.right.valid? if self.right
        end
        valid
      end

      # delete
      #
      # Delete the node from the BST
      #
      def delete
        if self.left.nil? || self.right.nil? # Either of left or right subtrees are empty
          node = self.left || self.right
          if self == self.parent.left
            self.parent.left = node
          else
            self.parent.right = node
          end
          node.parent = self.parent if node
        else # Both left and right subtrees are non-empty
          # Find minimum on the right tree (successor to this node)
          min_right_node = self.right.find_min
          # Swap the keys
          self.key = min_right_node.key
          # Now delete the successor recursively
          min_right_node.delete
        end
        self
      end
    end
  end
end