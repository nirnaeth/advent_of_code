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

#---
# itxt = open("input", mode='r').read().strip().splitlines()

# octopi = {(i,j): int(v) for i, r in enumerate(itxt) for j, v in enumerate(r)}
# last = {'r': max([r for (r,c) in octopi.keys()]), 'c': max([c for (r,c) in octopi.keys()])}

# flashes = 0

# def getns(r: int, c:int) -> set:
#     return [i for i in [(r-1,c),(r+1,c),(r,c-1),(r,c+1),(r-1,c-1),(r+1,c+1),(r+1,c-1),(r-1,c+1)] \
#         if i[0] >= 0 and i[0] <= last['r'] and i[1] >= 0 and i[1] <= last['c']]

# for s in range(100):
#     flashed = set()

#     #increment all
#     octopi = {i: int(v+1) for i, v in octopi.items()}

#     while len(flash := {(r,c) for ((r,c),v) in octopi.items() if (r,c) not in flashed and v >= 10}) > 0:

#         flashed.update(flash)

#         flashns = [neighbours(r,c) for (r,c) in flash]

#         for i in flashns:
#             for (r,c) in i:
#                 octopi.update({(r,c): octopi.get((r,c))+1})

#     for ((r,c),v) in octopi.items():
#         if v > 9:
#             octopi.update({(r,c):0})
#             flashes += 1

# print(flashes)

#---
flashes = 0

100.times do 
  flashed = {}

  coordinates.transform_values! { |energy| energy += 1 }

  flashing = coordinates.select { |coords, energy| energy > 9 && !flashed.keys.include?(coords) }

  flashing.each do |coords, energy|
    flashed.merge!({coords => energy})
    
    # neighbours
    x = coords.split(':').first.to_i
    y = coords.split(':').last.to_i
    energizing = neighbours(x, y, coordinates)

    energizing.each do |coords, energy|
      coordinates[coords] = coordinates[coords] += 1
    end
    # 
  end

  coordinates.each do |coords, energy|
    if energy > 9
      coordinates[coords] = 0
      flashes += 1
    end
  end
end

p flashes