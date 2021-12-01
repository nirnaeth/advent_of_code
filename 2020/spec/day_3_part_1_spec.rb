require "./day_3_part_1.rb"

RSpec.describe "#trees_on_slope" do
  it "returns the number of trees met on the way down" do
    path = "spec/support/input_day_3.txt"
    source = Input.new(path).to_str_array

    expect(trees_on_slope(source)).to eq 7
  end
end
