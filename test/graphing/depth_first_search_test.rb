require 'test_helper'
require 'ruby_algorithms'

class DepthFirstSearchTest < Minitest::Test
  include RubyAlgorithms::Graphing

  def test_dfs
    graph = get_test_graph
    dfs = DepthFirstSearch.new(graph)
    explored = []
    dfs.dfs do |i|
      explored << i.name
    end
    assert_equal explored, ["1", "2", "3", "4", "5", "6"]
    assert_equal dfs.finished.map(&:name), ["6", "5", "4", "3", "2", "1"]
  end

  def test_topological_sort
    graph = get_test_graph(true)
    dfs = DepthFirstSearch.new(graph)
    assert_equal dfs.topological_sort.map(&:name), ["1", "2", "3", "4", "5", "6"]
  end

  def get_test_graph(directed = false)
    graph = Graph.new(directed)
    graph.add_edge(Vertex.new("1"), Vertex.new("2"))
    graph.add_edge(Vertex.new("2"), Vertex.new("3"))
    graph.add_edge(Vertex.new("3"), Vertex.new("4"))
    graph.add_edge(Vertex.new("4"), Vertex.new("5"))
    graph.add_edge(Vertex.new("5"), Vertex.new("6"))
    graph.add_edge(Vertex.new("4"), Vertex.new("6"))
    graph
  end

end
