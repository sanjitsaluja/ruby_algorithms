require 'test_helper'
require 'ruby_algorithms'

class BubbleSortTest < Minitest::Test
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
      bubble_sort(test)
      assert_sorted(test)
    end
  end

  def assert_sorted(array)
    assert_equal array, array.sort
  end

end
