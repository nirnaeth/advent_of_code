# https://adventofcode.com/2023/day/1

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_1/part_1/input.txt"
values = Input.new(path).to_str_array("\n")

def clean_data(values)
  rows = values
    .map { |string| string.scan(/\d+/) }
    .map { |array| array.map { |element| element.split("") }.flatten }
    .map { |element| (element.first + element.last).to_i } 
end

def calibration_sum(calibration_data)
  clean_data(calibration_data).sum
end

p calibration_sum(values)