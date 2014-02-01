require 'test_helper'
require 'ruby_algorithms'

class MergeSortTest < Minitest::Test
  include RubyAlgorithms::Sort

  def test_merge_sort
    tests = [
        [3, 2, 1],
        [],
        [1],
        [1, 2],
        [0..100].shuffle,
        [OrderableModel.new(3), OrderableModel.new(0), OrderableModel.new(-3)]
    ]
    tests.each do |test|
      sorted = merge_sort(test)
      assert_sorted(sorted)
    end
  end

  def assert_sorted(array)
    assert_equal array.sort, array
  end

end
