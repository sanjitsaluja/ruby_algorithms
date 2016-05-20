require 'test_helper'
require 'ruby_algorithms'

class UnionFindTest < Minitest::Test
  include RubyAlgorithms::DataStructures

  def test
    a = (1..10).to_a
    set = UnionFind.new(a)
    a.each do |i|
      assert_equal set.find(i), i-1
    end

    set.union(1,10)
    assert_equal set.find(1), 0
    assert_equal set.find(10), 0

    set.union(2,9)
    assert_equal set.find(2), 1
    assert_equal set.find(9), 1

    set.union(9,10)
    set.union(1,2)
    assert_equal set.find(1), 1
    assert_equal set.find(2), 1
    assert_equal set.find(9), 1
    assert_equal set.find(10), 1
  end

end
