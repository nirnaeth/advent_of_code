require "pry"
require "./day_6/communication_system.rb"

RSpec.describe "#packet_start?" do
  it "returns true if the packet start marker is reached" do
    test_data = ["j", "p", "q", "m"]

    expect(packet_start?(test_data)).to be true
  end
end

RSpec.describe "#move" do
  xit "returns true if the packet start marker is reached" do
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