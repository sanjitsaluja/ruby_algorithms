require 'test_helper'
require 'ruby_algorithms'

class LinkedListTest < Minitest::Test
  include RubyAlgorithms::DataStructures

  def test_reverse
    a = (1..100).to_a
    list = LinkedList.new(a)
    list.reverse!
    assert_equal list.to_a, a.reverse
  end

end
