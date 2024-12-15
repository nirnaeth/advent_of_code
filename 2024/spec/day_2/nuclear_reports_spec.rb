require "pry"
require "./day_2/nuclear_reports.rb"

RSpec.describe "#lists" do
  it "prepares the lists" do
    input = [[3, 4], [4, 3], [2, 5], [1, 3], [3, 9], [3, 3]]

    left_list = [1, 2, 3, 3, 3, 4]
    right_list = [3, 3, 3, 4, 5, 9]

    expect(lists(input)).to eq [left_list, right_list]
  end
end

RSpec.describe "#calculate_distance" do
  it "returns the distance between two lists of locations" do
    left_list = [1, 2, 3, 3, 3, 4]
    right_list = [3, 3, 3, 4, 5, 9]

    expect(calculate_distance(left_list, right_list)).to eq 11
  end
end

RSpec.describe "#calculate_similarity" do
  it "returns the distance between two lists of locations" do
    left_list = [1, 2, 3, 3, 3, 4]
    right_list = [3, 3, 3, 4, 5, 9]

    expect(calculate_similarity(left_list, right_list)).to eq 31
  end
end
