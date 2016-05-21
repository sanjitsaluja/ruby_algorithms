module RubyAlgorithms
  module Graphing

    class Edge
      attr_accessor :weight
      attr_accessor :node_start
      attr_accessor :node_end
      attr_accessor :directed

      def ==(o)
        o.class == self.class &&
            o.weight== weight &&
            o.node_start == node_start &&
            o.node_end == node_end &&
            o.directed == directed
      end
    end

    class Vertex
      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def ==(other)
        self.class === other && @name == other.name
      end
      alias eql? ==

      def describe
        "Node #{@name}"
      end

      def hash
        @name.hash
      end

    end

    class Graph
      attr_accessor :adjacency_list
      attr_accessor :vertices
      attr_accessor :weights
      attr_accessor :directed

      def initialize(directed = false)
        @vertices = Set.new
        @adjacency_list = Hash.new { |h, k| h[k] = [] }
        @weights = Hash.new { |h, k| h[k] = 0 }
        @directed = directed
      end

      def all_edges
        edges = []
        @adjacency_list.each do |node_start, list|
          list.each do |node_end|
            weight = @weights[[node_start, node_end]]
            edge = Edge.new
            edge.node_start = node_start
            edge.node_end = node_end
            edge.directed = @directed
            edge.weight = weight
            edges << edge
          end
        end
        Set.new(edges)
      end

      def add_edge(node_start, node_end, weight = 0)
        @vertices.add(node_start)
        @vertices.add(node_end)
        @weights[[node_start, node_end]] = weight
        @adjacency_list[node_start] << node_end
        if @directed
          @adjacency_list[node_end] << node_start
          @weights[[node_end, node_start]] = weight
        end
      end
    end

  end
end