module RubyAlgorithms
  module Graphing
    class BreadthFirstSearch
      def initialize(graph, start)
        @graph = graph
        @start = start
        @parent = {@start => nil}
      end

      def shortest_path(vertex)
        path = []
        while @parent[vertex] != nil
          vertex = @parent[vertex]
          path << vertex
        end
        path.reverse
      end

      def bfs
        # TODO: Replace queue with a real O(N) queue
        queue = [@start]
        while queue.length > 0
          current = queue.shift
          if block_given?
            yield(current)
          end
          @graph.adjacency_list[current].each do |adjacent|
            unless @parent[adjacent]
              @parent[adjacent] = current
              queue.push(adjacent)
            end
          end
        end

      end
    end
  end
end
