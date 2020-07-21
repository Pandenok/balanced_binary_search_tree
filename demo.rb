require_relative "./balanced_bst.rb"

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
tree.insert(231)
tree.insert(105)
tree.insert(124)
tree.insert(199)
p tree.level_order

puts "\n5. Confirm that the tree is unbalanced by calling `#balanced?`"
puts tree.balanced?
puts "Visualization of unbalanced tree..."
tree.pretty_print

puts "\n6. Balance the tree by calling `#rebalance`"
tree.rebalance

puts "\n7. Confirm that the tree is balanced by calling `#balanced?`"
puts tree.balanced?
puts "Visualization of a balanced tree"
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

puts "\n9. Delete one number which has both children left and right from the added numbers in step 4"
tree.delete(199)
tree.pretty_print

puts "\n10. Delete one number which is leaf from the added numbers in step 4"
tree.delete(105)
tree.pretty_print

puts "\n11. Find a number from the added numbers in step 4"
p tree.find(231)

