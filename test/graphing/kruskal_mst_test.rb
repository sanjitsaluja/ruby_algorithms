require 'test_helper'
require 'ruby_algorithms'

class KruskalMSTSearchTest < Minitest::Test
  include RubyAlgorithms::Graphing

  def test_mst
    graph = get_test_graph
    mst = KruskalMST.new(graph)
    tree = mst.mst
    sum = 0
    tree.each do |e|
      sum += e.weight
    end
    assert_equal sum, 37
  end

  def get_test_graph(directed = false)
    graph = Graph.new(directed)
    graph.add_edge(Vertex.new("0"), Vertex.new("1"), 4)
    graph.add_edge(Vertex.new("0"), Vertex.new("7"), 8)
    graph.add_edge(Vertex.new("1"), Vertex.new("2"), 8)
    graph.add_edge(Vertex.new("1"), Vertex.new("7"), 11)
    graph.add_edge(Vertex.new("7"), Vertex.new("6"), 1)
    graph.add_edge(Vertex.new("7"), Vertex.new("8"), 7)
    graph.add_edge(Vertex.new("2"), Vertex.new("8"), 2)
    graph.add_edge(Vertex.new("6"), Vertex.new("8"), 6)
    graph.add_edge(Vertex.new("2"), Vertex.new("3"), 7)
    graph.add_edge(Vertex.new("2"), Vertex.new("5"), 4)
    graph.add_edge(Vertex.new("6"), Vertex.new("5"), 2)
    graph.add_edge(Vertex.new("3"), Vertex.new("5"), 14)
    graph.add_edge(Vertex.new("3"), Vertex.new("4"), 9)
    graph.add_edge(Vertex.new("5"), Vertex.new("4"), 10)

    graph
  end

end
