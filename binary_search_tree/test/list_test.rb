gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require './lib/list'
require 'pry'

class ListTest < Minitest::Test

  def test_that_list_object_exists
    tester = List.new
    assert tester
  end

  def test_that_head_is_initially_empty
    tester = List.new
    refute tester.head
  end
  
  def test_that_head_exists_after_one_insert
    tester = List.new
    tester.insert(1)
    assert tester.head
  end

  def test_that_left_right_returns_correct_values
    tester = List.new
    tester.insert(10)
    assert_equal 10, tester.head.data
    tester.insert(5)
    assert_equal 5, tester.head.left.data
    tester.insert(7)
    assert_equal 7, tester.head.left.right.data
  end

  def test_that_right_left_returns_correct_values
    tester = List.new
    tester.insert(5)
    assert_equal 5, tester.head.data
    tester.insert(10)
    assert_equal 10, tester.head.right.data
    tester.insert(7)
    assert_equal 7, tester.head.right.left.data
  end

  def test_that_unused_branches_are_nil
    tester = List.new
    tester.insert(5)
    refute tester.head.left
    refute tester.head.right
    tester.insert(10)
    refute tester.head.left
    tester.insert(7)
    refute tester.head.right.right
    refute tester.head.right.left.left
    refute tester.head.right.left.right
  end

  def test_that_include_identifies_empty_tree
    tester = List.new
    refute tester.include?(1)
  end

  def test_that_include_identifies_matching_head
    tester = List.new
    tester.insert(5)
    assert tester.include?(5)
  end

  def test_that_include_identifies_matching_left
    tester = List.new
    tester.insert(10)
    tester.insert(7)
    tester.insert(5)
    assert tester.include?(10)
    assert tester.include?(7)
    assert tester.include?(5)
  end

  def test_that_include_identifies_matching_right
    tester = List.new
    tester.insert(1)
    tester.insert(3)
    tester.insert(5)
    assert tester.include?(1)
    assert tester.include?(3)
    assert tester.include?(5)    
  end

  def test_that_include_does_not_always_pass
    tester = List.new
    tester.insert(3)
    tester.insert(1)
    tester.insert(5)
    refute tester.include?(0)
    refute tester.include?(2)
    refute tester.include?(4)
    refute tester.include?(6)
  end

  def test_that_max_search_identifies_empty_tree
    tester = List.new
    assert_equal nil, tester.max_value
  end

  def test_that_max_search_finds_max_when_head_is_max
    tester = List.new
    tester.insert(10)
    tester.insert(5)
    assert_equal 10, tester.max_value
  end

  def test_that_max_search_finds_max_with_multiple_steps
    tester = List.new
    tester.insert(1)
    tester.insert(2)
    tester.insert(3)
    tester.insert(4)
    assert_equal 4, tester.max_value
  end

  def test_that_max_search_finds_max_with_mixed_steps
    tester = List.new
    tester.insert(5)
    tester.insert(4)
    tester.insert(6)
    tester.insert(8)
    tester.insert(9)
    tester.insert(7)
    assert_equal 9, tester.max_value
  end

  def test_that_min_search_identifies_empty_tree
    tester = List.new
    assert_equal nil, tester.min_value
  end

  def test_that_min_search_finds_min_when_head_is_min
    tester = List.new
    tester.insert(5)
    tester.insert(10)
    assert_equal 5, tester.min_value
  end

  def test_that_min_search_finds_min_with_multiple_steps
    tester = List.new
    tester.insert(4)
    tester.insert(3)
    tester.insert(2)
    tester.insert(1)
    assert_equal 1, tester.min_value
  end

  def test_that_min_search_finds_min_with_mixed_steps
    tester = List.new
    tester.insert(7)
    tester.insert(9)
    tester.insert(8)
    tester.insert(6)
    tester.insert(4)
    tester.insert(5)
    assert_equal 4, tester.min_value
  end

  def test_that_depth_returns_zero_for_empty_tree
    tester = List.new
    assert_equal 0, tester.depth_of(7)
  end

  def test_that_depth_of_returns_1_for_head_match
    tester = List.new
    tester.insert(5)
    assert_equal 1, tester.depth_of(5)
  end

  def test_that_depth_of_returns_zero_for_missing_value
    tester = List.new
    tester.insert(1)
    tester.insert(2)
    assert_equal 0, tester.depth_of(3)
  end

  def test_that_depth_of_returns_correct_depth_with_multiple_leaves
    tester = List.new
    tester.insert(1)
    tester.insert(2)
    tester.insert(3)
    tester.insert(4)
    assert_equal 4, tester.depth_of(4)
  end

  def test_that_depth_of_returns_correct_depth_with_mixed_leaves
    tester = List.new
    tester.insert(5)
    tester.insert(7)
    tester.insert(6)
    tester.insert(3)
    tester.insert(4)
    tester.insert(1)
    tester.insert(9)
    assert_equal 3, tester.depth_of(1)
    assert_equal 3, tester.depth_of(9)
    assert_equal 3, tester.depth_of(4)
    assert_equal 3, tester.depth_of(6)
  end

  def test_that_sort_tree_returns_nil_for_empty_tree
    tester = List.new
    assert_equal nil, tester.sort
  end

  def test_that_sort_tree_works_with_random_data_set
    tester = List.new
    sample = (0..100).to_a.sample(30)
    sample.each { | n | tester.insert(n) }
    assert_equal sample.sort, tester.sort
  end

  def test_that_leaves_returns_nil_for_empty_tree
    tester = List.new
    assert_equal nil, tester.leaves
  end

  def test_that_leaves_is_correct_with_one_leaf
    tester = List.new
    tester.insert(2)
    tester.insert(1)
    assert_equal 1, tester.leaves
  end

  def test_that_leaves_is_correct_with_leaves_on_left_and_right
    tester = List.new
    tester.insert(2)
    tester.insert(1)
    tester.insert(3)
    assert_equal 2, tester.leaves
  end

  def test_that_leaves_is_correct_with_two_leaves_on_each_side
    tester = List.new
    tester.insert(5)
    tester.insert(3)
    tester.insert(2)
    tester.insert(4)
    tester.insert(7)
    tester.insert(8)
    tester.insert(6)
    assert_equal 4, tester.leaves
  end

  def test_that_max_depth_returns_nil_for_empty_tree
    tester = List.new
    assert_equal nil, tester.max_depth
  end

  def test_that_max_depth_returns_one_for_head_only
    tester = List.new
    tester.insert(5)
    assert_equal 1, tester.max_depth
  end

  def test_that_max_depth_recognizes_fork_from_higher_branch
    tester = List.new
    tester.insert(6)
    tester.insert(2)
    tester.insert(1)
    tester.insert(3)
    tester.insert(4)
    tester.insert(5)
    assert_equal 5, tester.max_depth
  end

  def test_that_max_depth_recognizes_all_right
    tester = List.new
    tester.insert(10)
    tester.insert(11)
    tester.insert(12)
    assert_equal 3, tester.max_depth
  end

  def test_that_max_depth_recognizes_right_with_left
    tester = List.new
    tester.insert(10)
    tester.insert(15)
    tester.insert(14)
    tester.insert(16)
    tester.insert(17)
    assert_equal 4, tester.max_depth
  end

  def test_that_remove_returns_nil_for_empty_tree
    tester = List.new
    assert_equal nil, tester.remove(1)
  end

  def test_that_remove_returns_nil_for_value_not_in_tree
    tester = List.new
    tester.insert(1)
    tester.insert(3)
    assert_equal nil, tester.remove(2)
  end

  def test_that_remove_removes_head
    tester = List.new
    tester.insert(3)
    tester.insert(2)
    tester.insert(4)
    tester.remove(3)
    refute tester.head.data == 3
  end

  def test_that_remove_removes_head_and_moves_head_right_if_no_left
    tester = List.new
    tester.insert(5)
    tester.insert(6)
    tester.insert(7)
    tester.remove(5)
    assert tester.head.data == 6
  end

  def test_that_remove_removes_left_with_left_branch
    tester = List.new
    tester.insert(5)
    tester.insert(3)
    tester.insert(2)
    tester.insert(4)
    tester.remove(3)
    assert tester.head.left.data == 2
  end

  def test_that_remove_removes_left_with_only_right_branch
    tester = List.new
    tester.insert(7)
    tester.insert(5)
    tester.insert(6)
    tester.insert(8)
    tester.remove(5)
    assert tester.head.left.data == 6
  end

  def test_that_remove_removes_right_with_left_branch
    tester = List.new
    tester.insert(15)
    tester.insert(17)
    tester.insert(16)
    tester.insert(18)
    tester.remove(17)
    assert tester.head.right.data == 16
  end

  def test_that_remove_removes_right_with_only_right_branch
    tester = List.new
    tester.insert(50)
    tester.insert(60)
    tester.insert(70)
    tester.insert(40)
    tester.remove(60)
    assert tester.head.right.data == 70
  end
end
