require 'test_helper'
require 'ruby_algorithms'

class KandaneMaxSumTest < Minitest::Test
  include RubyAlgorithms::BitAlgorithms

  def test_occurs_only_once
    a = [1,1,2,2,3,3,4]
    assert_equal occurs_only_once(a), 4
  end

end
