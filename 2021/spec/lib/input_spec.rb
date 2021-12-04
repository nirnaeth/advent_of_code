#$LOAD_PATH << './lib'
require 'input.rb'

RSpec.describe Input do
  describe "#to_int_array" do
    it "reads from disk into an array of integers" do
      path = "spec/support/day_1/input.txt"
      source = Input.new(path)

      day_input = source.to_int_array

      expect(day_input).to eq [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    end
  end

  describe "#to_str_array" do
    it "reads the file and converts it in an array of strings" do
      path = "spec/support/day_2/input.txt"
      source = Input.new(path)

      day_input = source.to_str_array

      expect(day_input).to eq ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    end

    it "accepts a custom separator" do
      path = "spec/support/day_4/input_2020.txt"
      source = Input.new(path)

      day_input = source.to_str_array("\n\n")

      expect(day_input.first).to eq "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm"
      expect(day_input.count).to eq 4
      expect(day_input).to be_an Array
    end
  end

  describe "#to_bit_matrix" do
    it "reads the file and converts it in a matrix of bits" do
      path = "spec/support/day_3/input.txt"
      source = Input.new(path)

      day_input = source.to_bit_matrix

      expect(day_input).to eq [
        [0, 0, 1, 0, 0], 
        [1, 1, 1, 1, 0], 
        [1, 0, 1, 1, 0], 
        [1, 0, 1, 1, 1], 
        [1, 0, 1, 0, 1], 
        [0, 1, 1, 1, 1], 
        [0, 0, 1, 1, 1], 
        [1, 1, 1, 0, 0], 
        [1, 0, 0, 0, 0], 
        [1, 1, 0, 0, 1], 
        [0, 0, 0, 1, 0], 
        [0, 1, 0, 1, 0]
      ]
    end
  end
end
