# https://adventofcode.com/2023/day/1

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_1/part_2/input.txt"
values = Input.new(path).to_str_array("\n")

def is_literal_digit?(string) 
  literals = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight" , "nine"]
  
  if literals.include?(string)
    literals.index(string).to_s
  else
    false
  end
end

def clean_data(values)
  ## the regex needs a lookahead to avoid consuming strings, since some of the input
  #  can be overlapping, for example eighthree should match 83
  rows = values
    .map { |string| string.scan( /(?=(zero|one|two|three|four|five|six|seven|eight|nine|\d+))/ ) }
    .map do |array| 
      array.map do |element| 
        element = element.pop
        is_literal_digit?(element) || element.split("") 
      end
      .flatten
    end
    .map { |element| (element.first + element.last).to_i } 
end

def calibration_sum(calibration_data)
  clean_data(calibration_data).sum
end

p calibration_sum(values)

## other weird cases
# seight3qvmq2f1kkfone
# 1anwsaojsaijqwoida