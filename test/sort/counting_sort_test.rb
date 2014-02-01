require 'test_helper'
require 'ruby_algorithms'

class CountingSortTest < Minitest::Test
  include RubyAlgorithms::Sort

  def test_sort
    tests = [
        [1, 1, 1, 1],
        [3, 2, 1],
        [],
        [1],
        [1, 2, 3],
        (1..100).to_a.shuffle,
    ]
    tests.each do |test|
      out = counting_sort(test, 1, 100)
      assert_sorted(out, test.sort)
    end
  end

  def assert_sorted(array, expected)
    assert_equal expected, array
  end

end
