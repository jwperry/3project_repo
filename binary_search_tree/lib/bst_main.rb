require './lib/list'
require './lib/node'
require './lib/file_in_out'
require 'pry'

handle = FileInOut.new
data = handle.reads
tree = List.new
data.each { | n | tree.insert(n) }

# Sample output
print data
print "\n\n"
puts "Tree includes 1? #{tree.include?(1)}"
puts "Tree includes 5? #{tree.include?(5)}"
puts "Tree includes 10? #{tree.include?(10)}\n\n"
puts "Tree includes 0? #{tree.include?(0)}"
puts "Tree includes 11? #{tree.include?(11)}\n\n"
puts "Tree max value: #{tree.max_value}"
puts "Tree min value: #{tree.min_value}\n\n"
puts "Depth of 5: #{tree.depth_of(5)}"
puts "Depth of 6: #{tree.depth_of(6)}"
puts "Depth of 8: #{tree.depth_of(8)}\n\n"
print "Sorted tree: #{tree.sort}\n\n"
puts "Leaves on tree: #{tree.leaves}\n\n"
puts "Max depth of tree: #{tree.max_depth}\n\n"

handle.writes("Sorted input:")
tree.sort.each do | n |
  handle.appends("\n")
  handle.appends(n)
end

tree.remove(2)
tree.remove(5)
tree.remove(7)
puts "Tree after removing 2, 5, 7 and sorting:"
sorted_after_removal = tree.sort
sorted_after_removal.each { | n | print "#{n} " }
puts "\n\n"