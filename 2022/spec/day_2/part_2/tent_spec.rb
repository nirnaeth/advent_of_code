require "pry"
require "./day_2/part_2/tent.rb"

RSpec.describe "#my_hand" do
  it "selects the value in the round matching my hand" do
    test_data = "A X"

    expect(my_hand(test_data)).to eq 3
  end
end

RSpec.describe "#pool" do
  it "divides the rounds in 3 pools (draws, losses, wins)" do
    path = "spec/data/day_2/input.txt"
    test_data = Input.new(path).to_str_array

    expect(pool(test_data)).to eq(
      { wins:   [1], 
        losses: [1],
        draws:  [1]
      }
    )
  end
end

RSpec.describe "#score" do
  it "returns the final score from the strategy guide" do
    path = "spec/data/day_2/input.txt"
    test_data = Input.new(path).to_str_array

    expect(score(test_data)).to eq 12
  end
end
