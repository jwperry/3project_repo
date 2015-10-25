require './lib/node'
require './lib/file_in_out'
require 'pry'

class List
  attr_reader :head
  attr_accessor :current, :previous

  def initialize
    @depth = 0
  end

  # Creates new node for argument value and checks for nil head.
  # Otherwise, calls Node class .push recursive method.
  def insert(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      @head.push(node)
    end
  end

  # Checks for nil head, then calls .search recursive method.
  # to see if argument value exists in the tree.
  def include?(data_to_find)
    exists = false
    if @head.nil?
      exists = false
    else
      exists = search(data_to_find, head)
    end
      return exists
  end

  # Recursive method to search for a value in tree.
  def search(data_to_find, node)
    if data_to_find < node.data && node.left
      search(data_to_find, node.left)
    elsif data_to_find > node.data && node.right
      search(data_to_find, node.right)
    elsif data_to_find == node.data
      return true
    else
      return false
    end
  end

  # Checks for nil head, then calls .max_search recursive method.
  def max_value
    if @head.nil?
      return "Empty!"
    else
      if head.right
        max_value = max_search(head.right)
      else
        max_value = head.data
      end
    end
    return max_value
  end

  # Recursive method to find max (right-most) value.
  def max_search(node)
    if node.right
      max_search(node.right)
    else
      return node.data
    end
  end

  # Checks for nil head, then calls .min_search recursive method.
  def min_value
    if @head.nil?
      return "Empty!"
    else
      if head.left
        min_value = min_search(head.left)
      else
        min_value = head.data
      end
    end
    return min_value
  end

  # Recursive method to find min (left-most) value.
  def min_search(node)
    if node.left
      min_search(node.left)
    else
      return node.data
    end
  end

  # Checks for nil head, then calls .depth_search recursive
  # method to return depth if the value exists in the tree.
  def depth_of(data_to_find)
    @depth = 0
    if @head.nil?
      return @depth
    else
      depth_search(data_to_find, head)
    end
    return @depth
  end

  # Recursive method to search for a value and return its depth.
  def depth_search(data_to_find, node)
    if data_to_find < node.data && node.left
      @depth += 1
      depth_search(data_to_find, node.left)
    elsif data_to_find > node.data && node.right
      @depth += 1
      depth_search(data_to_find, node.right)
    elsif data_to_find == node.data
      @depth += 1
    else
      @depth = 0
    end
  end

  

  
end