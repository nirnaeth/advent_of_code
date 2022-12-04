require "pry"
require "./day_4/cleanup.rb"

RSpec.describe "#assignment" do
  it "provides the assignment for a pair of elves" do
    test_data = "2-4,6-8"

    expect(assignment(test_data)).to eq [2..4, 6..8]
  end
end

RSpec.describe "#badge_priority" do
  xit "returns the sum of the priorities for all the duplicate items" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array

    expect(badge_priority(test_data)).to eq 70
  end
end
