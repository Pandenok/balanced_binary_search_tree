# frozen_string_literal: true

class Node
  attr_accessor :data, :right_child, :left_child
  def initialize(data = nil)
    @data = data
    @right_child = nil
    @left_child = nil
  end
end

class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted_array = array.sort.uniq

    return if sorted_array.empty?

    mid = sorted_array.size / 2

    root = Node.new(sorted_array[mid])
    root.left_child = build_tree(sorted_array[0...mid])
    root.right_child = build_tree(sorted_array[mid + 1..-1])

    root
  end

  def insert(value, node = @root)
    insert_right_child(value, node) if value > node.data
    insert_left_child(value, node) if value < node.data
  end

  def insert_right_child(value, node)
    if node.right_child.nil?
      node.right_child = Node.new(value)
    else
      insert(value, node.right_child)
    end
  end

  def insert_left_child(value, node)
    if node.left_child.nil?
      node.left_child = Node.new(value)
    else
      insert(value, node.left_child)
    end
  end

  def delete(value, node = @root)
    if value < node.data
      node.left_child = delete(value, node.left_child)
    elsif value > node.data
      node.right_child = delete(value, node.right_child)
    else
      if node.left_child.nil? || node.right_child.nil?
        temp = node.right_child if node.left_child.nil?
        temp = node.left_child if node.right_child.nil?
        node = nil
        return temp
      else
        delete_node_with_two_children(node)
      end
    end
    node
  end

  def delete_node_with_two_children(node)
    temp = smallest_inorder_successor(node.right_child)
    node.data = temp.data
    node.right_child = delete(temp.data, node.right_child)
  end

  def smallest_inorder_successor(node)
    current = node
    current = current.left_child until current.left_child.nil?
    current
  end

  def find(value, node = @root)
    return node if node.data.eql?(value)

    if value < node.data
      find(value, node.left_child)
    else
      find(value, node.right_child)
    end
  end

  def level_order(node = @root, queue = [], result = [])
    return result if node.nil?

    result << node.data
    queue << node.left_child unless node.left_child.nil?
    queue << node.right_child unless node.right_child.nil?

    level_order(queue.shift, queue, result)
  end

  def level_order_iterative(node = @root, queue = [], result = [])
    queue << node
    until queue.empty?
      current = queue.first
      result << current.data
      queue << current.left_child unless current.left_child.nil?
      queue << current.right_child unless current.right_child.nil?
      queue.delete(queue.first)
    end
    return result
  end

  def preorder(node = @root, values = [])
    return if node.nil?

    values << node.data
    preorder(node.left_child, values)
    preorder(node.right_child, values)
    values
  end

  def inorder(node = @root, values = [])
    return if node.nil?

    inorder(node.left_child, values)
    values << node.data
    inorder(node.right_child, values)
    values
  end

  def postorder(node = @root, values = [])
    return if node.nil?

    postorder(node.right_child, values)
    postorder(node.left_child, values)
    values << node.data
    values
  end

  def depth(node = @root)
    return 0 if node.nil?

    ldepth = depth(node.left_child)
    rdepth = depth(node.right_child)
    ldepth > rdepth ? (ldepth + 1) : (rdepth + 1)
  end

  def balanced?
    ldepth = depth(root.left_child)
    rdepth = depth(root.right_child)
    (ldepth - rdepth).abs <= 1
  end

  def rebalance
    @root = build_tree(inorder)
  end

  def pretty_print(node = root, prefix = "", is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data.to_s}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
