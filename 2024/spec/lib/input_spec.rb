#$LOAD_PATH << './lib'
require 'input.rb'

RSpec.describe Input do
  describe '#to_int_array' do
    it 'reads from disk into an array of integers' do
      path = 'spec/lib/data/int_array.txt'
      source = Input.new(path)

      day_input = source.to_int_array

      expect(day_input).to eq [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    end

    it 'accepts a custom separator' do
      path = 'spec/lib/data/int_array_custom_separator.txt'
      source = Input.new(path)

      day_input = source.to_int_array(',')

      expect(day_input).to eq [3, 4, 3, 1, 2]
    end
  end

  describe '#to_str_array' do
    it 'reads the file and converts it in an array of strings' do
      path = 'spec/lib/data/str_array.txt'
      source = Input.new(path)

      day_input = source.to_str_array

      expect(day_input).to eq ['forward 5', 'down 5', 'forward 8', 'up 3', 'down 8', 'forward 2']
    end

    it 'accepts a custom separator' do
      path = 'spec/lib/data/str_array_custom_separator.txt'
      source = Input.new(path)

      day_input = source.to_str_array("\n\n")

      expect(day_input.first).to eq "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm"
      expect(day_input.count).to eq 4
      expect(day_input).to be_an Array
    end
  end

  describe '#to_chr_array' do
    it 'reads the file and convert the contained string in an array of characters' do
      path = 'spec/lib/data/chr_array.txt'
      source = Input.new(path)

      day_input = source.to_chr_array

      expect(day_input).to eq ["m", "j", "q", "j", "p", "q", "m", "g", "b", "l", "j", "s", "p", "h", "d", "z", "t", "n", "v", "j", "f", "q", "w", "r", "c", "g", "s", "m", "l", "b"]
    end
  end

  describe '#to_bit_matrix' do
    it 'reads the file and converts it in a matrix of bits' do
      path = 'spec/lib/data/bit_matrix.txt'
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

  describe '#to_coordinates' do
    it 'reads the file and converts it to an hash for coordinates/value pairs' do
      path = 'spec/lib/data/coordinates.txt'
      source = Input.new(path)

      day_input = source.to_coordinates

      expect(day_input).to eq coordinates_hash
    end
  end
end

def coordinates_hash
  {
    "0:0"=>5, "1:0"=>4, "2:0"=>8, "3:0"=>3, "4:0"=>1, "5:0"=>4, "6:0"=>3, "7:0"=>2, "8:0"=>2, "9:0"=>3,
    "0:1"=>2, "1:1"=>7, "2:1"=>4, "3:1"=>5, "4:1"=>8, "5:1"=>5, "6:1"=>4, "7:1"=>7, "8:1"=>1, "9:1"=>1,
    "0:2"=>5, "1:2"=>2, "2:2"=>6, "3:2"=>4, "4:2"=>5, "5:2"=>5, "6:2"=>6, "7:2"=>1, "8:2"=>7, "9:2"=>3,
    "0:3"=>6, "1:3"=>1, "2:3"=>4, "3:3"=>1, "4:3"=>3, "5:3"=>3, "6:3"=>6, "7:3"=>1, "8:3"=>4, "9:3"=>6,
    "0:4"=>6, "1:4"=>3, "2:4"=>5, "3:4"=>7, "4:4"=>3, "5:4"=>8, "6:4"=>5, "7:4"=>4, "8:4"=>7, "9:4"=>8,
    "0:5"=>4, "1:5"=>1, "2:5"=>6, "3:5"=>7, "4:5"=>5, "5:5"=>2, "6:5"=>4, "7:5"=>6, "8:5"=>4, "9:5"=>5,
    "0:6"=>2, "1:6"=>1, "2:6"=>7, "3:6"=>6, "4:6"=>8, "5:6"=>4, "6:6"=>1, "7:6"=>7, "8:6"=>2, "9:6"=>1,
    "0:7"=>6, "1:7"=>8, "2:7"=>8, "3:7"=>2, "4:7"=>8, "5:7"=>8, "6:7"=>1, "7:7"=>1, "8:7"=>3, "9:7"=>4,
    "0:8"=>4, "1:8"=>8, "2:8"=>4, "3:8"=>6, "4:8"=>8, "5:8"=>4, "6:8"=>8, "7:8"=>5, "8:8"=>5, "9:8"=>4,
    "0:9"=>5, "1:9"=>2, "2:9"=>8, "3:9"=>3, "4:9"=>7, "5:9"=>5, "6:9"=>1, "7:9"=>5, "8:9"=>2, "9:9"=>6
  }
end
