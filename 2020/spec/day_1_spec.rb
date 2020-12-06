require "./day_1.rb"
require "input.rb"

RSpec.describe "#add_two_to_2020" do
  it "returns two numbers adding to 2020" do
    path = "#{File.expand_path File.dirname(__FILE__)}/support/input_day_1_spec.txt"
    source = Input.new(path).to_array

    expect(add_two_to_2020(source)).to eq [1721, 299]
  end
end

RSpec.describe "#add_three_to_2020" do
  it "returns three numbers adding to 2020" do
    path = "#{File.expand_path File.dirname(__FILE__)}/support/input_day_1_spec.txt"
    source = Input.new(path).to_array

    expect(add_three_to_2020(source)).to eq [979, 366, 675]
  end
end
