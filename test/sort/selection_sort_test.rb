require 'test_helper'
require 'ruby_algorithms'

class SelectionSortTest < Minitest::Test
  include RubyAlgorithms::Sort

  def test_sort
    tests = [
        [1, 1, 1, 1],
        [3, 2, 1],
        [],
        [1],
        [1, 2, 3],
        [0..100].shuffle,
        [OrderableModel.new(3), OrderableModel.new(0), OrderableModel.new(-3)]
    ]
    tests.each do |test|
      selection_sort(test)
      assert_sorted(test)
    end
  end

  def assert_sorted(array)
    assert_equal array, array.sort
  end

end
