require "pry"
require "./day_1/food.rb"

RSpec.describe "#max_calories" do
  it "returns the amount of calories of the biggest food stash" do
    path = "spec/data/day_1/input.txt"
    test_data = Input.new(path).to_str_array("\n\n")

    expect(max_calories(test_data)).to eq 24000
  end
end

