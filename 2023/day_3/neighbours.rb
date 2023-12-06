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

    current_number = nil

    chars.each_with_index do |char, x|
      if char == '.'
        # numbers << { current_number && current_number.to_i }
        next
      end

      if char =~ /^\d$/

      else
        symbols << { char => [y, x] }
      end
    end
  end

  return numbers, symbols
end


# def neighbours(x, y, map)
#   neighbours = {}

#   neighbours["#{y}:#{x - 1}"] = map["#{y}:#{x - 1}"] # right
#   neighbours["#{y + 1}:#{x}"] = map["#{y + 1}:#{x}"] # down
#   neighbours["#{y}:#{x + 1}"] = map["#{y}:#{x + 1}"] # left
#   neighbours["#{y - 1}:#{x}"] = map["#{y - 1}:#{x}"] # top
  
#   # diagonals - from [here](https://todd.ginsberg.com/post/advent-of-code/2021/day11/)

#   neighbours["#{y - 1}:#{x - 1}"] = map["#{y - 1}:#{x - 1}"] # top left
#   neighbours["#{y + 1}:#{x + 1}"] = map["#{y + 1}:#{x + 1}"] # bottom right
#   neighbours["#{y - 1}:#{x + 1}"] = map["#{y - 1}:#{x + 1}"] # top right
#   neighbours["#{y + 1}:#{x - 1}"] = map["#{y + 1}:#{x - 1}"] # bottom left

#   neighbours.select { |_, energy| energy != nil}
# end
