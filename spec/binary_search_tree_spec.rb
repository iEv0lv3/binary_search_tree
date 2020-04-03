require 'rspec'
require 'pry'
require './lib/bst'
require './lib/node'

describe 'Binary search tree' do
  before :each do
    @bst = Bst.new(50)
  end

  it 'bst root value is properly set' do
    expect(@bst.root.data).to eq(50)
  end

  it 'can step' do
    nodes = []
    numbers = (1...100).to_a.shuffle!
    numbers.delete(50)
    50.times { nodes.push(Node.new(numbers.pop)) }

    nodes.each do |node|
      @bst.find_home(node)
    end
  end
end
