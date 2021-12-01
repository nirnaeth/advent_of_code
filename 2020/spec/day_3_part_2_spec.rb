require "./day_3_part_2.rb"

RSpec.describe "#all_trees_on_slopes" do
  it "returns the product of all trees encoutered on different slopes" do
    path = "spec/support/input_day_3.txt"
    source = Input.new(path).to_str_array

    expect(all_trees_on_slopes(source)).to eq 336
  end
end
