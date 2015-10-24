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
    assert_equal "Empty!", tester.max_value
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
    assert_equal "Empty!", tester.min_value
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

end
