require "pry"
require "./day_4/cleanup.rb"

RSpec.describe "#to_range" do
  it "converts assignment characters to range" do
    test_data = ["2", "-", "4"]

    expect(to_range(test_data)).to eq 2..4
  end
end

RSpec.describe "#assignment" do
  it "provides the assignment for a pair of elves" do
    test_data = "2-4,6-8"

    expect(assignment(test_data)).to eq [2..4, 6..8]
  end
end

RSpec.describe "#full_overlap?" do
  it "returns true when one of the two ranges fully contains the other" do
    range_1 = 2..8
    range_2 = 3..7

    expect(full_overlap?(range_1, range_2)).to be true
  end

  it "returns false when the two ranges do not overlap" do
    range_1 = 2..4
    range_2 = 6..8

    expect(full_overlap?(range_1, range_2)).to be false
  end

  it "returns false when the two ranges overlap but none is fully contained in the other" do
    range_1 = 5..7
    range_2 = 7..9

    expect(full_overlap?(range_1, range_2)).to be false
  end
end

RSpec.describe "#overlaps" do
  it "counts how many assignments are overlapping" do
    path = "spec/data/day_4/input.txt"
    test_data = Input.new(path).to_str_array

    expect(overlaps(test_data)).to eq 2
  end
end
