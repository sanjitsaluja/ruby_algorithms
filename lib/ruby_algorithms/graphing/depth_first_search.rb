module RubyAlgorithms
  module Graphing
    class DepthFirstSearch
      attr_accessor :finished

      def initialize(graph)
        @graph = graph
        @parent = {}
        @finished = []
      end

      def topological_sort
        dfs
        @finished.reverse
      end

      def dfs(&block)
        @graph.vertices.each do |v|
          unless @parent[v]
            @parent[v] = :none
            dfs_visit(v, &block)
          end
        end
      end

      def dfs_visit(node, &block)
        if block_given?
          yield(node)
        end
        @graph.adjacency_list[node].each do |adjacent|
          unless @parent[adjacent]
            @parent[adjacent] = node
            dfs_visit(adjacent, &block)
          end
        end
        @finished << node
      end
    end
  end
end
