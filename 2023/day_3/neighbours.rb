# https://adventofcode.com/2023/day/2

$LOAD_PATH << './lib'
require "input.rb"

path = "data/day_3/input.txt"
rows = Input.new(path).to_str_array("\n")

def parse(rows)
  numbers = []
  symbols = []

  rows.each_with_index do |row, y|
    chars = row.split('')

    current_number = ""
    current_coordinates = []

    chars.each_with_index do |char, x|
      ## valid characters are finished, let's collect the numbers
      if char == '.'
        numbers << { (current_number.to_i) => current_coordinates} if !current_number.empty? # skips empty states

        current_number = ""
        current_coordinates = []
        next
      end

      if char =~ /^\d$/
        current_number += char
        current_coordinates << [y, x]
      else
        symbols << { char => neighbours(y, x) }
      end
    end
  end

  return numbers, symbols
end


def neighbours(y, x)
  # diagonals - from [here](https://todd.ginsberg.com/post/advent-of-code/2021/day11/)

  neighbours = []

  neighbours << [y - 1, x - 1] # top left
  neighbours << [y - 1, x] # top
  neighbours << [y - 1, x + 1] # top right

  neighbours << [y, x - 1] # left
  neighbours << [y, x + 1] # right
  
  neighbours << [y + 1, x - 1] # bottom left
  neighbours << [y + 1, x] # bottom
  neighbours << [y + 1, x + 1] # bottom right
  
  neighbours
end
