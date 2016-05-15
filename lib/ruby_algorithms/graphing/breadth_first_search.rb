module RubyAlgorithms
  module Graphing
    class BreadthFirstSearch
      def initialize(graph, start)
        @graph = graph
        @start = start
        @visited = {}
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
        queue = [@start]

        while queue.length > 0
          current = queue.shift
          @visited[current] = true
          if block_given?
            yield(current)
          end
          @graph.adjacency_list[current].each do |adjacent|
            @parent[adjacent] ||= current
            unless @visited[adjacent]
              queue.push(adjacent)
            end
          end
        end

      end
    end
  end
end
