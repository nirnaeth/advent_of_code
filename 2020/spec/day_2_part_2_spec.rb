require "./day_2_part_2.rb"

RSpec.describe "#number_of_valid_passwords" do
  it "returns all the valid passwords" do
    path = "spec/support/input_day_2.txt"
    source = Input.new(path).to_str_array

    expect(number_of_valid_passwords(source)).to eq 1
  end
end
