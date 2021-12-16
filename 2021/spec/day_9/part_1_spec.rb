require './day_9/low_points'
require 'pry'

RSpec.describe '#neighbours_values' do
  it 'finds the neighbours of the specified location' do
    # [2, 1,  9 ,  9 ,  9 , 4, 3, 2, 1, 0], 
    # [3, 9,  8 , _7_,  8 , 9, 4, 9, 2, 1], 
    # [9, 8, _5_, x6x, _7_, 8, 9, 8, 9, 2], 
    # [8, 7,  6 , _7_,  8 , 9, 6, 7, 8, 9], 
    # [9, 8,  9 ,  9 ,  9 , 6, 5, 6, 7, 8]
    coordinates = Coordinate.new(2, 3) # x, y
    
    expect(neighbours_values(coordinates, map)).to eq [7, 9, 7, 5]
  end

  it 'returns less than 4 neighbours if the element is on the border of the map' do
    top_left = Coordinate.new(0, 0)
    bottom_right = Coordinate.new(map.first.size - 1, map.size - 1) # x, y
  
    expect(neighbours_values(top_left, map)).to match_array [1, 3]
    expect(neighbours_values(bottom_right, map)).to match_array [9, 7]
  end
end

RSpec.describe '#low_points_values' do
  it 'finds the value of the low points on the map' do
    expect(low_points_values(map)).to eq [1, 0, 5, 5]
  end
end

RSpec.describe '#low_points' do
  it 'returns the low points values and their coordinates' do
    expect(low_points(map)).to eq ({
      "0:1" => 1, 
      "0:9" => 0, 
      "2:2" => 5, 
      "4:6" => 5
    })
  end
end

RSpec.describe '#neighbours' do
  it 'finds the neighbours of the specified location' do
    # [2, 1,  9 ,  9 ,  9 , 4, 3, 2, 1, 0], 
    # [3, 9,  8 , _7_,  8 , 9, 4, 9, 2, 1], 
    # [9, 8, _5_, x6x, _7_, 8, 9, 8, 9, 2], 
    # [8, 7,  6 , _7_,  8 , 9, 6, 7, 8, 9], 
    # [9, 8,  9 ,  9 ,  9 , 6, 5, 6, 7, 8]
    coordinates = Coordinate.new(2, 3) # x, y
    
    expect(neighbours(coordinates, map)).to eq (
      {
        "2:2" => 5, 
        "3:1" => 7, 
        "3:3" => 7, 
        "4:2" => 7 
      }
    )
  end

  it 'returns less than 4 neighbours if the element is on the border of the map' do
    top_left = Coordinate.new(0, 0)
    bottom_right = Coordinate.new(map.first.size - 1, map.size - 1) # x, y

    expect(neighbours(top_left, map)).to eq ({"0:1" => 1, "1:0" => 3}) # y:x
    expect(neighbours(bottom_right, map)).to eq ({"3:9" => 9, "4:8" => 7}) # y:x
  end
end

RSpec.describe '#basins' do
  it 'returns the size of a basin' do
    points = low_points(basin_map)

    expect(basins(points, basin_map)).to eq [6]
  end

  it 'returns the size of the basins' do
    points = low_points(map)

    expect(basins(points, map)).to eq [6, 19, 101, 61]
  end
end

def basin_map
  [
    [2, 1, 9, 9], 
    [3, 9, 9, 9], 
    [9, 9, 9, 9]
  ]
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

# "0:1" => 1, 
#       "0:9" => 0, 
#       "2:2" => 5, 
#       "4:6" => 5