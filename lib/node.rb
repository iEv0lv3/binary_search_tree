class Node
  attr_accessor :right_branch,
                :left_branch,
                :depth

  attr_reader   :data

  def initialize(data)
    @data = data
    @right_branch = nil
    @left_branch = nil
    @depth = 0
  end

  def node_placement(node, parent_node)
    node.depth += 1
    # Recursively call node_placement in place of parent_node.right
    if node.data > parent_node.data
      parent_node.right(node, parent_node)
    else
      parent_node.left(node, parent_node)
    end
  end

  def place_node(node, parent_node)
    # This mehtod will determine if a node is placed
  end

  def right(node, parent_node)
    if parent_node.right_branch.nil?
      parent_node.right_branch = node
    else
      node_placement(node, parent_node.right_branch)
    end
  end

  def left(node, parent_node)
    if parent_node.left_branch.nil?
      parent_node.left_branch = node
    else
      node_placement(node, parent_node.left_branch)
    end
  end
end
