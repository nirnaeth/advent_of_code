require './day_11/octopus'
require 'pry'

RSpec.describe '#setup' do
  it 'organizes octopi by energy level' do
    octopi = {
      '0:0' => 3,
      '0:1' => 4,
      '0:2' => 3,
      '0:3' => 1,
      '0:4' => 2
    }
    
    ledger = setup(octopi)

    expect(ledger).to eq ([
      [], 
      [{"0:3"=>1}], 
      [{"0:4"=>2}], 
      [{"0:0"=>3, "0:2"=>3}], 
      [{"0:1"=>4}], 
      [], 
      [], 
      [], 
      [], 
      []
    ])
  end
end

RSpec.describe '#update_levels' do
  it 'increases the energy level of the octopi during one step' do
    ledger = [
      [], 
      [{'0:3' => 1}], 
      [{'0:4' => 2}], 
      [{'0:0' => 3, '0:2' => 3}], 
      [{'0:1' => 4}], 
      [], 
      [], 
      [], 
      [], 
      []
    ]

    new_levels = update_levels(ledger)

    expect(new_levels).to eq (
      [
        [], 
        [], 
        [{'0:3' => 1}], 
        [{'0:4' => 2}], 
        [{'0:0' => 3, '0:2' => 3}], 
        [{'0:1' => 4}], 
        [], 
        [], 
        [], 
        []
      ]
    )
  end

  it 'resets an octopus energy level to 0 after a flash' do
    ledger = [
      [], 
      [], 
      [], 
      [], 
      [], 
      [],
      [{'0:3' => 1}], 
      [{'0:4' => 2}], 
      [{'0:0' => 3, '0:2' => 3}], 
      [{'0:1' => 4}]
    ]

    new_levels = update_levels(ledger)

    expect(new_levels).to eq (
      [
        [{'0:1' => 4}],
        [], 
        [], 
        [], 
        [], 
        [], 
        [],
        [{'0:3' => 1}], 
        [{'0:4' => 2}], 
        [{'0:0' => 3, '0:2' => 3}]
      ]
    )
  end
end

RSpec.describe '#neighbours' do
  it 'finds the neighbours of the specified octopus' do
    # [2,  1 ,  9 ,  9 , 9, 4, 3, 2, 1, 0], 
    # [3,  9 ,  8 ,  7 , 8, 9, 4, 9, 2, 1], 
    # [9, _8_, _5_, _6_, 7, 8, 9, 8, 9, 2], 
    # [8, _7_, x6x, _7_, 8, 9, 6, 7, 8, 9], 
    # [9, _8_, _9_, _9_ , 9, 6, 5, 6, 7, 8]
    coordinates = Coordinate.new(2, 3) # x, y
    
    expect(neighbours(coordinates, map)).to eq (
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
  end

  it 'discards neighbours out of the map' do
    coordinates = Coordinate.new(1, 0) # x, y
    octopi = {
      '0:0' => 1,
      '0:1' => 9,
      '0:2' => 9,
      '0:3' => 9,
      '0:4' => 1
    }

    expect(neighbours(coordinates, octopi)).to eq (
      {
        "0:0" => 1, 
        "0:2" => 9
      }
    )
  end
end

RSpec.describe '#count_flashes' do
  it 'increases energy levels by 1' do
    octopi = {
      '0:0' => 3,
      '0:1' => 4,
      '0:2' => 3,
      '0:3' => 1,
      '0:4' => 2
    }

    expect(count_flashes(octopi)).to eq (
      {
        '0:0' => 4,
        '0:1' => 5,
        '0:2' => 4,
        '0:3' => 2,
        '0:4' => 3
      }
    )
  end

  it 'counts the number of octopi that flash in a step when there are no flashing neighbours' do
    octopi = {
      '0:0' => 1, '0:1' => 1, '0:2' => 1, '0:3' => 1, '0:4' => 1,
      '1:0' => 1, '1:1' => 9, '1:2' => 9, '1:3' => 9, '1:4' => 1,
      '2:0' => 1, '2:1' => 9, '2:2' => 9, '2:3' => 9, '2:4' => 1,
      '3:0' => 1, '3:1' => 9, '3:2' => 9, '3:3' => 9, '3:4' => 1,
      '4:0' => 1, '4:1' => 1, '4:2' => 1, '4:3' => 1, '4:4' => 1
    }

    expect(count_flashes(octopi, 2)).to eq 9
  end

  it 'counts the number of octopi that flash in a step when there are flashing neighbours' do
    path = 'spec/support/day_11/input.txt'
    octopi = Input.new(path).to_coordinates

    expect(count_flashes(octopi, 2)).to eq 35
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