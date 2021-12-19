require './day_11/octopus'
require 'pry'

RSpec.describe '#neighbours' do
  it 'finds the neighbours of the specified octopus' do
    x = 2
    y = 3    

    expect(neighbours(x, y, coordinates)).to eq (
      {
        "2:2" => 5, 
        "2:1" => 8, 
        "3:1" => 7,
        "4:1" => 8, 
        "4:2" => 9, 
        "4:3" => 9,
        "3:3" => 7,
        "2:3" => 6,
      }
    )

    # [2,  1 ,  9 ,  9 , 9, 4, 3, 2, 1, 0], 
    # [3,  9 ,  8 ,  7 , 8, 9, 4, 9, 2, 1], 
    # [9, _8_, _5_, _6_, 7, 8, 9, 8, 9, 2], 
    # [8, _7_, x6x, _7_, 8, 9, 6, 7, 8, 9], 
    # [9, _8_, _9_, _9_ , 9, 6, 5, 6, 7, 8]
  end

  it 'discards neighbours out of the map' do
    x = 1
    y = 0

    octopi = {
      '0:0' => 1,
      '0:1' => 9,
      '0:2' => 9,
      '0:3' => 9,
      '0:4' => 1
    }

    expect(neighbours(x, y, octopi)).to eq (
      {
        "0:0" => 1, 
        "0:2" => 9
      }
    )
  end
end

RSpec.describe '#count_flashes' do
  it 'returns the number of octopi that flash' do
    path = 'spec/support/day_11/input.txt'
    octopi = Input.new(path).to_coordinates

    expect(count_flashes(octopi, 2)).to eq 35
  end
end

def coordinates
  {
    '0:0' => 2, '0:1' => 1, '0:2' => 9, '0:3' => 9, '0:4' => 9, '0:5' => 4, '0:6' => 3, '0:7' => 2, '0:8' => 1, '0:9' => 0,
    '1:0' => 3, '1:1' => 9, '1:2' => 8, '1:3' => 7, '1:4' => 8,' 1:5' => 9, '1:6' => 4, '1:7' => 9, '1:8' => 2, '1:9' => 1,
    '2:0' => 9, '2:1' => 8, '2:2' => 5, '2:3' => 6, '2:4' => 7, '2:5' => 8, '2:6' => 9, '2:7' => 8, '2:8' => 9, '2:9' => 2,
    '3:0' => 8, '3:1' => 7, '3:2' => 6, '3:3' => 7, '3:4' => 8, '3:5' => 9, '3:6' => 6, '3:7' => 7, '3:8' => 8, '3:9' => 9,
    '4:0' => 9, '4:1' => 8, '4:2' => 9, '4:3' => 9, '4:4' => 9, '4:5' => 6, '4:6' => 5, '4:7' => 6, '4:8' => 7, '4:9' => 8,
  }
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