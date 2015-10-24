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
print "\n"
data.each do | n |
  puts "Tree includes #{n}? #{tree.include?(n)}"
end
puts "Tree includes 0? #{tree.include?(0)}"
puts "Tree includes 10? #{tree.include?(10)}"
puts "Tree max value: #{tree.max_value}"
puts "Tree min value: #{tree.min_value}"