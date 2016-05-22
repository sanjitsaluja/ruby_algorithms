require 'test_helper'
require 'ruby_algorithms'

class LongestCommonSubsequenceTest < Minitest::Test
  include RubyAlgorithms::DynamicProgramming

  def test_lcd
    lcs = LongestCommonSubsequence.new("acbaed", "abcadf")
    assert_equal lcs.lcs, "acad"
  end

end
