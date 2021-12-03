require "./day_3/diagnostic"

RSpec.describe "#find_rates" do
  it "returns the gamma rate and the epsilon rate" do
    path = 'spec/support/day_3/input.txt'
    readings = Input.new(path).to_str_array

    expect(count_depth_increases(measures)).to eq 7
  end
end

RSpec.describe "#count_depth_increases" do
  it "returns the times the depth increases among triples" do
    path = 'spec/support/day_1/input.txt'
    measures = Input.new(path).to_int_array

    expect(count_depth_increases_in_triples(measures)).to eq 5
  end
end
