require "pry"
require "./day_6/communication_system.rb"

RSpec.describe "#start?" do
  it "returns true if there is a sequence of n non repeating characters" do
    test_data = ["m", "j", "q", "p"]

    expect(start?(test_data)).to be true
  end
  
  it "returns false if there are duplicate characters in a sequence of n characters" do
    test_data = ["m", "j", "q", "j", "p", "q", "m", "g", "b", "l", "j", "s", "p", "h", "d", "z", "t", "n", "v", "j"]

    expect(start?(test_data)).to be false
  end
end

RSpec.describe "#packet_position" do
  it "returns the number of characters to be processed before the packet start marker is identified" do
    path = "spec/data/day_6/input.txt"
    test_data = Input.new(path).to_chr_array

    expect(packet_position(test_data)).to eq 7
  end
end

RSpec.describe "#message_position" do
  it "returns the number of characters to be processed before the packet start marker is identified" do
    path = "spec/data/day_6/input.txt"
    test_data = Input.new(path).to_chr_array

    expect(message_position(test_data)).to eq 19
  end
end