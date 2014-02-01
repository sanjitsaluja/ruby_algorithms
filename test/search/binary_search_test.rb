require 'test_helper'
require 'ruby_algorithms'

class BinarySearchTest < Minitest::Test
  include RubyAlgorithms::Search

  def test_nil
    assert_nil binary_search(nil, 1)
    assert_nil binary_search(nil, nil)
    assert_nil binary_search([], nil)
    assert_nil binary_search([1,2,3], nil)
    assert_nil binary_search([], 1)
  end

  def test_ints
    assert_equal binary_search([1,2,3], 1), 0
    assert_equal binary_search([1,2], 2), 1
    assert_equal binary_search([1,2,3,4], 3), 2
    assert_equal binary_search([1,2,3], 0), nil
  end

  def test_objects
    models = [
        OrderableModel.new(1),
        OrderableModel.new(2),
        OrderableModel.new(3),
    ]
    assert_equal binary_search(models, OrderableModel.new(1)), 0
    assert_nil binary_search(models, OrderableModel.new(4))
  end
end
