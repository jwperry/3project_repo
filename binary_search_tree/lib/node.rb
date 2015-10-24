require './lib/list'
require './lib/file_in_out'
require 'pry'

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  # Recursive method to locate appropriate empty left or right link
  # to insert new node.
  def push(node)
    if left.nil? && node.data < @data
      @left = node
    elsif right.nil? && node.data > @data
      @right = node
    elsif node.data < @data
      left.push(node)
    elsif node.data > @data
      right.push(node)
    else
      puts "Input contains duplicate entry!"
      exit
    end
  end

end