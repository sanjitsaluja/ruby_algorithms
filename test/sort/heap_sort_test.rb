require 'test_helper'
require 'ruby_algorithms'

class HeapSortTest < Minitest::Test
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
      sorted = heap_sort(test)
      assert_sorted(sorted)
    end
  end

  def test_insert
    @heap = Heap.new
    a = [27, 1, 47, 26, 29, 12, 28, 35, 11, 46, 16, 49, 32, 8, 30, 3, 6, 15, 44, 24, 48, 37, 25, 7, 2, 22, 17, 18, 10, 9, 34, 36, 33, 21, 40, 50, 45, 20, 38, 19, 5, 43, 41]
    a.each do |i|
      @heap.insert(i)
    end

    sorted = []
    while @heap.size > 0
      sorted.push @heap.extract_min
    end
    assert_sorted(sorted)
  end

  def assert_sorted(array)
    assert_equal array, array.sort
  end

end
