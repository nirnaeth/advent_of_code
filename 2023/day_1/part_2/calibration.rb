# https://adventofcode.com/2023/day/1

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_1/part_2/input.txt"
values = Input.new(path).to_str_array("\n")

def clean_data(values)
  rows = values
    .map { |string| string.scan(/\b(?:zero|one|two|three|four|five|six|seven|eight|nine|\d+)\b/i) }
    .map { |array| array.map { |element| element.split("") }.flatten }
    .map { |element| (element.first + element.last).to_i } 
end

def calibration_sum(calibration_data)
  clean_data(calibration_data).sum
end

p calibration_sum(values)