require "./day_1/part_1.rb"
require "./lib/input.rb"

RSpec.describe "#count_depth_increases" do
  it "returns all the times the depth increases" do
    path = 'spec/support/day_1/input_part_1.txt'
    measures = Input.new(path).to_int_array

    expect(count_depth_increases(measures)).to eq 7
  end
end
