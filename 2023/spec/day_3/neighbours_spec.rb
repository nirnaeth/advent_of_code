require "pry"
require "./day_3/neighbours.rb"

RSpec.describe "#parse" do
  it "returns a list of numbers and a list of symbols with their coordinates" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    numbers, symbols = parse(test_data)

    # expect(numbers).to eq expected_numbers
    expect(symbols).to eq expected_symbols
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
    { 592 => [[6, 2], [6, 2], [6, 3]] },
    { 755 => [[7, 6], [7, 7], [7, 8]] },
    { 664 => [[9, 1], [9, 2], [9, 3]] },
    { 592 => [[9, 5], [9, 6], [9, 7]] }
  ]
end

def expected_symbols
  # [y, x]
  [
    { "*" => [1, 3] },
    { "#" => [3, 6] },
    { "*" => [4, 3] },
    { "+" => [5, 5] },
    { "$" => [8, 3] },
    { "*" => [8, 5] }
  ]
end
