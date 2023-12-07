require "pry"
require "./day_4/scratchcards.rb"

RSpec.describe "#parse" do
  it "returns a list of numbers and a list of symbols with their coordinates" do
    path = "spec/data/day_4/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(parse(test_data)).to eq 13
  end
end
