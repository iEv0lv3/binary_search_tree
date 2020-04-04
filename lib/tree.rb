require_relative 'node'

class Tree
  attr_reader :root

  def initialize(data = nil)
    @root = data
  end

  def insert(node)
    @root = node if @root.nil?
    @root.node_step(node, @root)
  end

  def include?(search, node = @root)
    return false if node.nil?

    if search < node.data
      include?(search, node.left_branch)
    elsif search > node.data
      include?(search, node.right_branch)
    else
      { 'true' => node }
    end
  end

  def depth_of(data)
    node = include?(data)
    if node == false
      'Data not found.'
    else
      node['true'].depth
    end
  end
end
