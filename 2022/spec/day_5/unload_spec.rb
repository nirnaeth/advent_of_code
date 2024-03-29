require "pry"
require "./day_5/unload.rb"

RSpec.describe "#moves" do
  it "provides the sequence of moves in a usable format" do
    path = "spec/data/day_5/input.txt"
    _, test_data = Input.new(path).to_str_array("\n\n")

    expect(moves(test_data)).to match_array [
      { moves: 1, from: 2, to: 1 },
      { moves: 3, from: 1, to: 3 },
      { moves: 2, from: 2, to: 1 },
      { moves: 1, from: 1, to: 2 }
    ]
  end
end

RSpec.describe "#arrangement" do
  it "provides the arrangement of the crates in a usable format" do
    path = "spec/data/day_5/input.txt"
    test_data, _ = Input.new(path).to_str_array("\n\n")

    expect(arrangement(test_data)).to match_array [
      nil,
      ["Z", "N"],
      ["M", "C", "D"],
      ["P"]
    ]
  end
end

RSpec.describe "#move" do
  it "moves a crate" do
    test_arrangement = [
      nil,
      ["Z", "N"],
      ["M", "C", "D"],
      ["P"]
    ]

    test_move = { moves: 1, from: 2, to: 1 }

    expect(move(test_arrangement, test_move)).to match_array [
      nil,
      ["Z", "N", "D"],
      ["M", "C"],
      ["P"]
    ]
  end

  it "moves multiple crates" do
    test_arrangement = [
      nil,
      ["Z", "N"],
      ["M", "C", "D"],
      ["P"]
    ]

    test_move = { moves: 2, from: 2, to: 1 }

    expect(move(test_arrangement, test_move)).to match_array [
      nil,
      ["Z", "N", "D", "C"],
      ["M"],
      ["P"]
    ]
  end
end

RSpec.describe "#top_crates" do
  it "returns the list of the crates on top of each column" do
    path = "spec/data/day_5/input.txt"
    test_setup, test_instructions = Input.new(path).to_str_array("\n\n")

    expect(top_crates(test_setup, test_instructions)).to eq "CMZ"
  end
end