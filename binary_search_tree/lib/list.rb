require './lib/node'
require './lib/file_in_out'
require 'pry'

class List
  attr_reader :head

  def initialize
    @depth = 0
    @sorted_tree = []
    @leaves = 0
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
      return nil
    else
      if head.right
        max_value = max_search(head.right).data
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
      return node
    end
  end

  # Checks for nil head, then calls .min_search recursive method.
  def min_value
    if @head.nil?
      return nil
    else
      if head.left
        min_value = min_search(head.left).data
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
      return node
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

  # Checks for nil head, then calls .sort_tree recursive method
  # to sort tree.
  def sort
    @sorted_tree = []
    if @head.nil?
      return nil
    else
      sort_tree(head)
    end
    return @sorted_tree
  end

  # Recursive method to return sorted array.
  def sort_tree(node)
    if node.left
      @sorted_tree = sort_tree(node.left)
    end
    @sorted_tree << node.data
    if node.right
      @sorted_tree = sort_tree(node.right)
    end
    return @sorted_tree
  end

  # Checks for nil head, then calls .find_leaves recursive method
  # to locate nodes with no new left/right branches.
  def leaves
    @leaves = 0
    if @head.nil?
      return nil
    else
      find_leaves(head)
    end
    return @leaves
  end

  # Recursive method to return leaf count.
  def find_leaves(node)
    if node.left
      @leaves = find_leaves(node.left)
    end
    if node.right
      @leaves = find_leaves(node.right)
    end
    if node.left.nil? && node.right.nil?
      @leaves += 1
    end
    return @leaves
  end

  # Checks for nil head, then calls .find_max_depth recursive method
  # to find greatest distance from head to a leaf.
  def max_depth
    if @head.nil?
      return nil
    else
      max_depth = find_max_depth(head)
    end
    return max_depth
  end

  # Recursive method to find greatest distance from head to a leaf
  # by comparing max left distance to max right distance from
  # given node.
  def find_max_depth(node, depth=0)
    if node.nil?
      return depth
    else
      left_depth = find_max_depth(node.left, depth + 1)
      right_depth = find_max_depth(node.right, depth + 1)
      if left_depth > right_depth
        return left_depth
      else
        return right_depth
      end
    end
  end

  # Checks for empty tree, and checks if head holds the value to
  # remove. If neither, calls methods to either remove head or
  # remove a non-head value in the tree with recursive search.
  def remove(value)
    if self.include?(value)
      if head.data == value
        remove_head(value, head)
      else
        remove_value(value, head)
      end
    else
      return nil
    end
  end

  # Removes head and sets head to head.left, head.right, or
  # nil (if empty) in that order.
  def remove_head(value, node)
    if node.left
      link = max_search(node.left)
      link.right = @head.right
      @head = @head.left
    elsif node.right
      link = min_search(node.right)
      link.left = @head.left
      @head = @head.right
    else
      @head = nil
    end
  end

  # Removes non-head value, attempts to use left branch from node
  # first to repair tree, or right branch if no left branch.
  # Sorry, ran out of time to refactor this one.
  def remove_value(value, node)
    if node.left && value < node.data
      if node.left.data == value
        if node.left.left
          link = max_search(node.left.left)
          link.right = node.left.right
          node.left = node.left.left
        elsif node.left.right
          node.left = node.left.right
        else
          node.left = nil
        end
      else
        remove_value(value, node.left)
      end

    elsif node.right && value > node.data
      if node.right.data == value
        if node.right.left
          link = max_search(node.right.left)
          link.right = node.right.right
          node.right = node.right.left
        elsif node.right.right
          node.right = node.right.right
        else
          node.right = nil
        end
      else
        remove_value(value, node.right)
      end
    end
  end
end