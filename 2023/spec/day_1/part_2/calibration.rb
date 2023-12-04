require "pry"
require "./day_1/part_2/calibration.rb"

RSpec.describe "#clean_data" do
  it "returns an array containing only values with the first and last digit present in the string" do
    path = "spec/data/day_1/part_2/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(clean_data(test_data)).to match [29, 83, 13, 24, 42, 14, 76]
  end

  # it "returns the first and last digit if the string is all numbers" do
  #   path = "spec/data/day_1/part_2/single_number.txt"
  #   test_data = Input.new(path).to_str_array("\n")

  #   expect(clean_data(test_data)).to match [68]
  # end

  # it "returns the first and last digit if the string has the last number with multiple digits" do
  #   path = "spec/data/day_1/part_2/double_number.txt"
  #   test_data = Input.new(path).to_str_array("\n")

  #   expect(clean_data(test_data)).to match [82]
  # end
end

RSpec.describe "#calibration_sum" do
  it "returns the sum of all calibration values" do
    path = "spec/data/day_1/part_2/input.txt"
    test_data = Input.new(path).to_str_array("\n")

    expect(calibration_sum(test_data)).to eq 281
  end
end
