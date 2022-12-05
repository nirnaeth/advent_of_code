require "pry"
require "./day_5/sit.rb"

RSpec.describe "#overlaps" do
  xit "counts how many assignments are overlapping" do
    path = "spec/support/input_day_5.txt"
    test_data = Input.new(path).to_str_array

    expect(overlaps(test_data)).to eq 2
  end
end