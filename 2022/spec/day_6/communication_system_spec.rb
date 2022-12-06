require "pry"
require "./day_6/communication_system.rb"

RSpec.describe "#packet_start?" do
  it "returns true if there is a sequence of 4 non repeating characters" do
    test_data = ["m", "j", "q", "p"]

    expect(packet_start?(test_data)).to be true
  end
  
  it "returns false if there are duplicate characters in a sequence of 4" do
    test_data = ["m", "j", "q", "j"]

    expect(packet_start?(test_data)).to be false
  end
end

RSpec.describe "#marker_position" do
  it "returns the number of characters to be processed before the packet start marker is identified" do
    path = "spec/data/day_6/input.txt"
    test_data = Input.new(path).to_chr_array

    expect(marker_position(test_data)).to eq 7
  end
end