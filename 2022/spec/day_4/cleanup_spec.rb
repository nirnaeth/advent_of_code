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

RSpec.describe "#overlaps" do
  it "counts how many assignments are overlapping" do
    path = "spec/data/day_4/input.txt"
    test_data = Input.new(path).to_str_array

    expect(overlaps(test_data)).to eq 2
  end
end
