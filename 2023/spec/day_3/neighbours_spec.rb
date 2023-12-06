require "pry"
require "./day_3/neighbours.rb"

RSpec.describe "#parse" do
  it "returns a list of numbers and a list of symbols with their coordinates" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    numbers, symbols = parse(test_data)

    expect(numbers).to eq expected_numbers
    expect(symbols).to eq expected_symbols
  end
end

RSpec.describe '#neighbours' do
  it 'finds the neighbours of a point' do
    x = 2
    y = 3    

    expect(neighbours(y, x)).to match [
      [2, 1], [2, 2], [2, 3], 
      [3, 1], [3, 3], 
      [4, 1], [4, 2], [4, 3]
    ]
  end

  xit 'discards neighbours out of the map' do
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

def expected_numbers
  # [y, x]
  [
    { 467 => [[0, 0], [0, 1], [0, 2]] },
    { 114 => [[0, 5], [0, 6], [0, 7]] },
    { 35 =>  [[2, 2], [2, 3]] },
    { 633 => [[2, 6], [2, 7], [2, 8]] },
    { 617 => [[4, 0], [4, 1], [4, 2]] },
    { 58 =>  [[5, 7], [5, 8]] },
    { 592 => [[6, 2], [6, 3], [6, 4]] },
    { 755 => [[7, 6], [7, 7], [7, 8]] },
    { 664 => [[9, 1], [9, 2], [9, 3]] },
    { 598 => [[9, 5], [9, 6], [9, 7]] }
  ]
end

def expected_symbols
  # [y, x]
  [
    { "*" => [[0, 2], [0, 3], [0, 4], [1, 2], [1, 4], [2, 2], [2, 3], [2, 4]] },
    { "#" => [[2, 5], [2, 6], [2, 7], [3, 5], [3, 7], [4, 5], [4, 6], [4, 7]] },
    { "*" => [[3, 2], [3, 3], [3, 4], [4, 2], [4, 4], [5, 2], [5, 3], [5, 4]] },
    { "+" => [[4, 4], [4, 5], [4, 6], [5, 4], [5, 6], [6, 4], [6, 5], [6, 6]] },
    { "$" => [[7, 2], [7, 3], [7, 4], [8, 2], [8, 4], [9, 2], [9, 3], [9, 4]] },
    { "*" => [[7, 4], [7, 5], [7, 6], [8, 4], [8, 6], [9, 4], [9, 5], [9, 6]] }
  ]
end
