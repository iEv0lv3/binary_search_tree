class Node
  attr_accessor :data,
                :right_child,
                :left_child,
                :depth

  def initialize(data)
    @data = data
    @right_child = nil
    @left_child = nil
    @depth = 0
  end

  def child_step(node, parent)
    node.depth += 1
    if direction(node, parent) == 'right'
      parent.right_step(node, parent)
    else
      parent.left_step(node, parent)
    end
  end

  def right_step(node, parent)
    if parent.right_child.nil?
      parent.right_child = node
    else
      child_step(node, parent.right_child)
    end
  end

  def left_step(node, parent)
    if parent.left_child.nil?
      parent.left_child = node
    else
      child_step(node, parent.left_child)
    end
  end

  def direction(node, parent)
    if node.data > parent.data
      'right'
    else
      'left'
    end
  end
end
