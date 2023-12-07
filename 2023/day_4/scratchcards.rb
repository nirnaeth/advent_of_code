# https://adventofcode.com/2023/day/4

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_4/input.txt"
values = Input.new(path).to_str_array("\n")

##
# \s* removes the initial spaces
def parse(values)
  [].tap do |points| 
    values
      .map do |card| 
        elements = card
          .split(": ")[1]
          .split(' | ')
          .map { |card| card.split(' ') }

        numbers = elements[0] & elements[1]
        points << 2 ** (numbers.count - 1) unless numbers.empty?
      end
    end.sum
end
