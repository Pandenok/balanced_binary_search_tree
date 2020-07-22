require_relative "./balanced_bst.rb"

# test_array = [15, 51, 53, 57, 4, 83, 71, 91, 16, 33, 45, 15, 95, 67, 45]
# tree = Tree.new(test_array)
# puts "Test Array: #{test_array}"

puts "\n1. Create a binary search tree from an array of random numbers"
random_array = Array.new(15) { rand(1..100) }
puts "Random Array: #{random_array}"
tree = Tree.new(random_array)

puts "\n2. Confirm that the tree is balanced by calling `#balanced?`"
puts tree.balanced?
puts "Visualization of a balanced tree"
tree.pretty_print

puts "\n3. Print out all elements in level, pre, post, and in order"
puts "Breadth-first level order:"
p tree.level_order
puts "\nDepth-first pre-order traversal:"
p tree.preorder
puts "\nDepth-first post-order traversal:"
p tree.postorder
puts "\nDepth-first in-order traversal:"
p tree.inorder

puts "\n4. Try to unbalance the tree by adding several numbers > 100"
tree.insert(124)
tree.insert(105)
tree.insert(139)
tree.insert(199)
tree.insert(231)
puts "Added numbers: 231, 105, 124, 199."
p tree.level_order

puts "\n5. Confirm that the tree is unbalanced by calling `#balanced?`"
puts tree.balanced?
puts "Visualization of unbalanced tree..."
tree.pretty_print

puts "\n6. Balance the tree by calling `#rebalance`"
tree.rebalance

puts "\n7. Confirm that the tree is balanced by calling `#balanced?`"
puts tree.balanced?
puts "Visualization of a re-balanced tree"
tree.pretty_print

puts "\n8. Print out all elements in level, pre, post, and in order"
puts "Breadth-first level order:"
p tree.level_order
puts "\nDepth-first pre-order traversal:"
p tree.preorder
puts "\nDepth-first post-order traversal:"
p tree.postorder
puts "\nDepth-first in-order traversal:"
p tree.inorder

puts "\n9. Delete one number (124) with both left and right children from the added numbers in step 4"
tree.delete(124)
tree.pretty_print

puts "\n10. Delete one leaf number (231) from the added numbers in step 4"
tree.delete(231)
tree.pretty_print

puts "\n11. Find a number (105) from the added numbers in step 4"
p tree.find(105)

puts "\n12. Print out the depth (number of levels beneath the root) of the current tree"
puts "The tree has #{tree.depth} levels"


