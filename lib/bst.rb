require_relative 'node'

class Bst
  attr_reader :root

  def initialize(root)
    @root = Node.new(root)
  end

  def find_home(node)
    @root.child_step(node, @root)
  end
end
