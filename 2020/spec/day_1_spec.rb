require "./day_1.rb"

RSpec.describe "#add_two_to_2020" do
  it "returns two numbers adding to 2020" do
    path = "spec/support/input_day_1.txt"
    source = Input.new(path).to_int_array

    expect(add_two_to_2020(source)).to eq [1721, 299]
  end
end

RSpec.describe "#add_three_to_2020" do
  it "returns three numbers adding to 2020" do
    path = "spec/support/input_day_1.txt"
    source = Input.new(path).to_int_array

    expect(add_three_to_2020(source)).to eq [979, 366, 675]
  end
end
