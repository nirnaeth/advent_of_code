require "pry"
require "./day_8/tree_house_location.rb"

RSpec.describe "#visible?" do
  it "returns true when the tree is on the edge" do
    path = "spec/data/day_8/input.txt"
    test_data = Input.new(path).to_coordinates

    first_tree = [0, 0]
    last_tree =  [4, 4]

    expect(visible?(test_data, first_tree)).to eq true
    expect(visible?(test_data, last_tree)).to eq true
  end
end