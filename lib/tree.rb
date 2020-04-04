require_relative 'node'

class Tree
  attr_reader :root

  def initialize(root)
    @root = Node.new(root)
  end

  def insert(node)
    @root.node_step(node, @root)
  end

  def include?(search, node = @root)
    confirm_search(search)
    return nil if node.nil?

    if search < node.data
      include?(search, node.left_branch)
    elsif search > node.data
      include?(search, node.right_branch)
    else
      node
    end
  end

  def confirm_search(search)
    puts 'Please enter an integer' if search != Integer
  end
end
