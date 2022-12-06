require "pry"
require "./day_5/sit.rb"

RSpec.describe "#parse" do
  it "returns the sequences for rows and columns from the boarding pass" do
    test_data = "FBFBBFFRLR"

    expect(parse(test_data)).to match_array ["FBFBBFF", "RLR"]
  end
end

RSpec.describe "#row" do
  it "identifies the row where the seat is" do
    test_data = "FBFBBFF"

    expect(row(test_data)).to eq 44
  end
end

RSpec.describe "#column" do
  it "identifies the row where the seat is" do
    test_data = "RLR"

    expect(column(test_data)).to eq 5
  end
end

RSpec.describe "#seat" do
  it "identifies the seat" do
    row = 44
    column = 5

    expect(seat(row, column)).to eq 357
  end
end

RSpec.describe "highest_seat" do
  it "returns the seat with the highest ID" do
    path = "spec/support/input_day_5.txt"
    test_data = Input.new(path).to_str_array

    expect(highest_seat(test_data)).to eq 820
  end
end