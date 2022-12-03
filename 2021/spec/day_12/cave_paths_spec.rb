require './day_12/cave_paths'
require 'pry'

RSpec.describe '#list_neighbours' do
  it 'lists all caves that can be visited from a cave' do
    input = ['start-A', 'start-b', 'A-c', 'A-b', 'b-d', 'A-end', 'b-end']

    paths = list_neighbours(input)

    expect(list_neighbours(input)).to match ({
      'A' => ['c', 'b', 'end'], 
      'b' => ['A', 'd', 'end'], 
      'c' => ['A'], 
      'd' => ['b'], 
      'start' => ['A', 'b']
    })
  end
end

RSpec.describe '#valid_complete_paths' do
  it 'returns the number of paths that finish at the end cave, passing via small caves only once' do
    paths = {
      'A' => ['c', 'b', 'end'], 
      'b' => ['A', 'd', 'end'], 
      'c' => ['A'], 
      'd' => ['b'], 
      'start' => ['A', 'b']
    }

    expect(valid_complete_paths(paths, ['start'])).to eq 10

  end
end