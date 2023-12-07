require "pry"
require "./day_4/scratchcards.rb"

RSpec.describe "#points_won" do
  it "returns the total points won" do
    path = "spec/data/day_4/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(points_won(test_data)).to eq 13
  end
end

RSpec.describe "#cards_won" do
  it "returns the amount of cards won by scratching the original cards" do
    path = "spec/data/day_4/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(cards_won(test_data)).to match_array [4, 2, 2, 1, 0, 0]
  end
end