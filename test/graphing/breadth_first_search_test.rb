require 'test_helper'
require 'ruby_algorithms'

class BreadthFirstSearchTest < Minitest::Test
  include RubyAlgorithms::Graphing

  def test_bfs
    graph = Graph.new
    graph.add_edge(Vertex.new("1"), Vertex.new("2"))
    graph.add_edge(Vertex.new("2"), Vertex.new("3"))
    graph.add_edge(Vertex.new("3"), Vertex.new("4"))
    graph.add_edge(Vertex.new("4"), Vertex.new("5"))
    graph.add_edge(Vertex.new("5"), Vertex.new("6"))
    graph.add_edge(Vertex.new("4"), Vertex.new("6"))

    bfs = BreadthFirstSearch.new(graph, Vertex.new("1"))
    explored = []
    bfs.bfs do |i|
      explored << i.name
    end
    assert explored, ["1", "2", "3", "4", "5", "6"]

    path = bfs.shortest_path(Vertex.new("6"))
    assert path.map { |x| x.name }, ["1", "2", "3", "4"]
  end

end
