gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require './lib/node'
require './lib/list'
require 'pry'

class NodeTest < Minitest::Test

  def test_that_node_object_exists
    tester = Node.new(1)
    assert tester
  end

  def test_that_left_is_initially_empty
    tester = Node.new(1)
    refute tester.left
  end

  def test_that_right_is_initially_empty
    tester = Node.new(1)
    refute tester.right
  end
  
  def test_that_left_exists_after_one_lesser_insert
    tester = List.new
    tester.insert(5)
    tester.insert(3)
    assert tester.head.left
  end

  def test_that_right_exists_after_one_greater_insert
    tester = List.new
    tester.insert(5)
    tester.insert(7)
    assert tester.head.right
  end

end