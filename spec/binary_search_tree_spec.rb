require 'rspec'
require 'pry'
require './lib/tree'
require './lib/node'

describe 'Binary search tree' do
  before :each do
    @tree = Tree.new(Node.new(50))
    @nodes = []
    numbers = (1...100).to_a.shuffle!
    numbers.delete(@tree.root.data)
    50.times { @nodes.push(Node.new(numbers.pop)) }

    @nodes.each do |node|
      @tree.insert(node)
    end
  end

  it 'tree root node value can be set' do
    expect(@tree.root.data).to eq(50)
  end

  it 'nodes can be inserted into a tree' do
    tree = Tree.new(Node.new(5))
    node1 = tree.insert(Node.new(3))
    expect(tree.root.left_branch).to eq(node1)

    node2 = tree.insert(Node.new(4))
    expect(tree.root.left_branch.right_branch).to eq(node2)

    node3 = tree.insert(Node.new(7))
    expect(tree.root.right_branch).to eq(node3)

    node4 = tree.insert(Node.new(6))
    expect(tree.root.right_branch.left_branch).to eq(node4)
  end

  it 'tree can be searched' do
    tree = Tree.new(Node.new(5))
    tree.insert(Node.new(3))
    tree.insert(Node.new(4))
    tree.insert(Node.new(7))
    node1 = tree.insert(Node.new(6))

    expect(tree.include?(17)).to eq(false)
    expect(tree.include?(6)).to eq({ 'true' => node1 })
    expect(tree.include?(5)).to eq({ 'true' => tree.root })
  end

  it 'can find depth of data' do
    tree = Tree.new(Node.new(5))
    tree.insert(Node.new(3))
    tree.insert(Node.new(4))
    tree.insert(Node.new(7))
    tree.insert(Node.new(6))

    expect(tree.depth_of(4)).to eq(2)
    expect(tree.depth_of(17)).to eq('Data not found.')
    expect(tree.depth_of(6)).to eq(2)
    expect(tree.depth_of(7)).to eq(1)
    expect(tree.depth_of(5)).to eq(0)
  end
end
