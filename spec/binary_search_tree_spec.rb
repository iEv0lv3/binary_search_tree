require 'rspec'
require 'pry'
require './lib/tree'
require './lib/node'

describe 'Binary search tree' do
  before :each do
    @tree = Tree.new(50)
  end

  it 'tree root node value can be set' do
    expect(@tree.root.data).to eq(50)
  end

  it 'nodes can be inserted into a tree' do
    nodes = []
    numbers = (1...100).to_a.shuffle!
    numbers.delete(@tree.root.data)
    99.times { nodes.push(Node.new(numbers.pop)) }

    nodes.each do |node|
      @tree.insert(node)
    end
  end
end
