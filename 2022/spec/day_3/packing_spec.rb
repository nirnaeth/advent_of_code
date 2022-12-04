require "pry"
require "./day_3/packing.rb"

RSpec.describe "#compartments" do
  it "divides the content in the two compartments" do
    test_data = "vJrwpWtwJgWrhcsFMMfFFhFp"

    expect(compartments_diff(test_data)).to eq "p"
  end
end

RSpec.describe "#priority" do
  it "returns the priority of the item packed" do
    expect(priority("p")).to eq 16
  end
end

RSpec.describe "#total_priority" do
  it "returns the sum of the priorities for all the duplicate items" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array

    expect(total_priority(test_data)).to eq 157
  end
end

RSpec.describe "#badge" do
  it "finds the group badge" do
    test_data = [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg"
    ]

    expect(badge(test_data)).to eq "r"
  end
end

RSpec.describe "#badge_priority" do
  it "returns the sum of the priorities for all the duplicate items" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array

    expect(badge_priority(test_data)).to eq 70
  end
end
