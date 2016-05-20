module RubyAlgorithms
  module DataStructures

    # UnionFind:
    #
    # Disjoint-set data structure - https://en.wikipedia.org/wiki/Disjoint-set_data_structure
    # Find Time Complexity:  O(Lg N)
    # Union Time Complexity:  O(Lg N)
    #
    class UnionFind
      attr_accessor :elements

      def initialize(elements)
        @elements = elements
        @indices = {}
        elements.each_with_index { |x, i| @indices[x] = i }
        @parent = Array.new(elements.count)
        @ranks = Array.new(elements.count, 0)
      end

      def find(x)
        index = @indices[x]
        while @parent[index] != nil
          index = @parent[index]
        end
        index
      end

      def union(x, y)
        parent_x = find(x)
        parent_y = find(y)
        unless parent_x == parent_y
          rank_x = @ranks[parent_x]
          rank_y = @ranks[parent_y]
          if rank_x < rank_y
            @parent[parent_x] = parent_y
          elsif rank_y < rank_x
            @parent[parent_y] = parent_x
          else
            @parent[parent_y] = parent_x
            @ranks[parent_x] += 1
          end
        end
      end

    end
  end
end
