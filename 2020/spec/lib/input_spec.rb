#$LOAD_PATH << './lib'
require 'input.rb'

RSpec.describe Input do
  describe "#to_int_array" do
    it "reads from disk into an array of integers" do
      path = "spec/support/input_day_1.txt"
      source = Input.new(path)

      day_input = source.to_int_array

      expect(day_input).to eq [1721, 979, 366, 299, 675, 1456]
    end
  end

  describe "#to_str_array" do
    it "reads the file and converts it in an array of strings" do
      path = "spec/support/input_day_2.txt"
      source = Input.new(path)

      day_input = source.to_str_array

      expect(day_input).to eq ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]
    end

    it "accepts a custom separator" do
      path = "spec/support/input_day_4.txt"
      source = Input.new(path)

      day_input = source.to_str_array("\n\n")

      expect(day_input.first).to eq "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm"
      expect(day_input.count).to eq 4
      expect(day_input).to be_an Array
    end
  end
end
