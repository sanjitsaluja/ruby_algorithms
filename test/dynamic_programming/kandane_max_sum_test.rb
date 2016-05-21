require 'test_helper'
require 'ruby_algorithms'

class KandaneMaxSumTest < Minitest::Test
  include RubyAlgorithms::DynamicProgramming

  def test_max_sum
    kandane = KandaneMaxSum.new([-1, 3, -5, 4, 6, -1, 2, -7, 13, -3])
    sum, start, stop = kandane.max_subarray
    assert_equal sum, 17
    assert_equal start, 3
    assert_equal stop, 8
  end

end
