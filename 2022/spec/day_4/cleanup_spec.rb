require "pry"
require "./day_4/cleanup.rb"

RSpec.describe "#compartments" do
  xit "divides the content in the two compartments" do
    test_data = "vJrwpWtwJgWrhcsFMMfFFhFp"

    expect(compartments_diff(test_data)).to eq "p"
  end
end

RSpec.describe "#badge_priority" do
  xit "returns the sum of the priorities for all the duplicate items" do
    path = "spec/data/day_3/input.txt"
    test_data = Input.new(path).to_str_array

    expect(badge_priority(test_data)).to eq 70
  end
end
