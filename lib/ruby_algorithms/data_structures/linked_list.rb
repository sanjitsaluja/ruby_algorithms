module RubyAlgorithms
  module DataStructures

    # Node:
    #
    # A node in the linked list
    #
    class Node
      attr_accessor :value
      attr_accessor :next

      def initialize(value)
        @value = value
      end
    end

    # UnionFind:
    #
    # Disjoint-set data structure - https://en.wikipedia.org/wiki/Disjoint-set_data_structure
    # Find Time Complexity:  O(Lg N)
    # Union Time Complexity:  O(Lg N)
    #
    class LinkedList
      attr_accessor :start

      def initialize(array)
        previous_node = nil
        array.each do |i|
          unless @start
            @start = Node.new(i)
            previous_node = @start
            next
          end
          previous_node.next = Node.new(i)
          previous_node = previous_node.next
        end
      end

      def reverse!
        last = @start
        next_node = @start.next if @start
        while next_node
          next_next_node = next_node.next
          next_node.next = last
          last = next_node
          next_node = next_next_node
        end
        @start.next = nil
        @start = last
      end

      def to_a
        a = []
        next_node = @start
        while next_node
          a.push(next_node.value)
          next_node = next_node.next
        end
        a
      end

    end
  end
end
