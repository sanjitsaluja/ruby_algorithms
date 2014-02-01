require 'test_helper'
require 'ruby_algorithms'

class AVLTreeTest < Minitest::Test
  include RubyAlgorithms::Search

  def test_find
    tree = get_test_tree
    assert_equal tree.find(3).key, 3
    assert_nil tree.find(1001)
  end

  # def test_delete_root
  #   tree = get_test_tree
  #   tree.delete tree.root.key
  #   assert tree.valid?
  # end
  #
  # def test_deletes
  #   tree = get_test_tree
  #   (1..1000).to_a.shuffle.each do |i|
  #     tree.delete i
  #     assert tree.valid?
  #   end
  # end

  def get_test_tree
    tree = AVLTree.new
    (1..1000).to_a.shuffle.each do |i|
      tree.insert i
      assert tree.valid?
    end
    tree
  end
end
