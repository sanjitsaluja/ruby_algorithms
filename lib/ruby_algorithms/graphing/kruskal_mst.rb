module RubyAlgorithms
  module Graphing
    # KruskalMST
    #
    # Kruskal MST Algorithm - https://en.wikipedia.org/wiki/Kruskal%27s_algorithm
    #
    # Find MST in O(E lg E + E lg V)
    class KruskalMST
      def initialize(graph)
        @graph = graph
        @disjoint_set = RubyAlgorithms::DataStructures::UnionFind.new(@graph.vertices)
      end

      def mst
        edges = @graph.all_edges.sort {|e1, e2| e1.weight <=> e2.weight}
        tree = []
        edges.each do |edge|
          s = @disjoint_set.find(edge.node_start)
          e = @disjoint_set.find(edge.node_end)
          if s != e
            @disjoint_set.union(edge.node_start, edge.node_end)
            tree << edge
            if tree.count >= @graph.vertices.count - 1
              break
            end
          end
        end
        tree
      end
    end
  end
end
