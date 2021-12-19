# https://adventofcode.com/2021/day/11

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_11/input.txt'

octopi = Input.new(path).to_bit_matrix
coordinates = Input.new(path).to_coordinates

def neighbours(x, y, map)
  neighbours = {}

  neighbours["#{y}:#{x - 1}"] = map["#{y}:#{x - 1}"] # right
  neighbours["#{y + 1}:#{x}"] = map["#{y + 1}:#{x}"] # down
  neighbours["#{y}:#{x + 1}"] = map["#{y}:#{x + 1}"] # left
  neighbours["#{y - 1}:#{x}"] = map["#{y - 1}:#{x}"] # top
  
  # diagonals - from [here](https://todd.ginsberg.com/post/advent-of-code/2021/day11/)

  neighbours["#{y - 1}:#{x - 1}"] = map["#{y - 1}:#{x - 1}"] # top left
  neighbours["#{y + 1}:#{x + 1}"] = map["#{y + 1}:#{x + 1}"] # bottom right
  neighbours["#{y - 1}:#{x + 1}"] = map["#{y - 1}:#{x + 1}"] # top right
  neighbours["#{y + 1}:#{x - 1}"] = map["#{y + 1}:#{x - 1}"] # bottom left

  neighbours.select { |_, energy| energy != nil}
end

# During a single step, the following occurs:

# - First, the energy level of each octopus increases by 1.
# - Then, any octopus with an energy level greater than 9 flashes. 
#   This increases the energy level of all adjacent octopuses by 1, including octopuses that are diagonally adjacent. 
#   If this causes an octopus to have an energy level greater than 9, it also flashes. 
#   This process continues as long as new octopuses keep having their energy level increased beyond 9. 
#   (An octopus can only flash at most once per step.)
# - Finally, any octopus that flashed during this step has its energy level set to 0, as it used all of its energy to flash.

  # 4907 is too high
  # 4869 is too high
  # 1866 is too high
  # 1856 is not the right answer (100)
  # 1846 in not the right answer (99)
  # 1710 is not the right answer (second method)

# how many flashes?
