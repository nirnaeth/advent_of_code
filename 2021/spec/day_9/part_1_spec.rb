require './day_9/low_points'
require 'pry'

RSpec.describe '#neighbours' do
  it 'finds the neighbours of the specified location' do
    input_map = map
    coordinates = Coordinate.new(2, 3)
    
    expect(neighbours(coordinates, input_map)).to eq [7, 9, 7, 5]
  end

  it 'returns less than 4 neighbours if the element is on the border of the map' do
    input_map = map
    top_left = Coordinate.new(0, 0)
    bottom_right = Coordinate.new(map.first.size - 1, map.size - 1)

    expect(neighbours(top_left, input_map)).to match_array [1, 3]
    expect(neighbours(bottom_right, input_map)).to match_array [9, 7]
  end
end

RSpec.describe '#low_points' do
  it 'finds the low points on the map' do
    input_map = map

    expect(low_points(input_map)).to eq [1, 0, 5, 5]
  end
end

def map
  [
    [2, 1, 9, 9, 9, 4, 3, 2, 1, 0], 
    [3, 9, 8, 7, 8, 9, 4, 9, 2, 1], 
    [9, 8, 5, 6, 7, 8, 9, 8, 9, 2], 
    [8, 7, 6, 7, 8, 9, 6, 7, 8, 9], 
    [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
  ]
end
