# frozen_string_literal: true

require_relative 'node'

class Tree
  attr_reader :root

  def initialize(data = nil)
    @root = data
  end

  def insert(node_input)
    node = create_node(node_input)
    @root = node if @root.nil?
    @root.node_placement(node, @root)
  end

  def create_node(node)
    node.class == Node ? node : Node.new(node)
  end

  def include?(search_input)
    search = search_type(search_input)
    tree_search(search)
  end

  def tree_search(search, node = @root)
    return false if node.nil?

    if search < node.data
      tree_search(search, node.left_branch)
    elsif search > node.data
      tree_search(search, node.right_branch)
    else
      { 'true' => node }
    end
  end

  def depth_of(search_input)
    search = search_type(search_input)
    node = tree_search(search)
    node == false ? 'Data not found.' : node['true'].depth
  end

  def search_type(search)
    search.class == Node ? search.data : search
  end

  def max(current_max = 0, node = @root)
    return current_max if node.nil?

    if current_max > node.data
      max(current_max, node.left_branch)
    elsif current_max < node.data
      max(node.data, node.right_branch)
    else
      current_max
    end
  end
end
