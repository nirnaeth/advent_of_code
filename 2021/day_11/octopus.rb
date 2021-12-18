# https://adventofcode.com/2021/day/11

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_11/input.txt'

# each octupus = level of energy until it flashes. constant = > level 9 flash

# octopi.each do |octupus|
#   octopus += 1
#   if octopus == 9
#     neighbours = all_neighbours += 1 # 8 around
#     flash 
#     record flashing
#     octopus = 0

#     neighbours.each do |neighbour|
#       neighbours = all_neighbours += 1 # 8 around
#       flash 
#       record flashing
#       octopus = 0
#     end
#   end
# end

octopi = Input.new(path).to_bit_matrix
coordinates = Input.new(path).to_coordinates

LOWEST = 0
HIGHEST = 9
STEPS = 100

Coordinate = Struct.new(:x, :y)

# def setup(coords)
#   [].tap do |ledger|
#     (0..9).each do |energy_level|
#       ledger[energy_level] = [] if ledger[energy_level].nil?
#       same_level = coords.select { |_, v| v == energy_level }
#       ledger[energy_level] << same_level if same_level.any?
#     end
#   end
# end

def neighbours(coordinates, map)
  neighbours = {}

  neighbours["#{coordinates.y}:#{coordinates.x - 1}"] = map["#{coordinates.y}:#{coordinates.x - 1}"] # right
  neighbours["#{coordinates.y + 1}:#{coordinates.x}"] = map["#{coordinates.y + 1}:#{coordinates.x}"] # down
  neighbours["#{coordinates.y}:#{coordinates.x + 1}"] = map["#{coordinates.y}:#{coordinates.x + 1}"] # left
  neighbours["#{coordinates.y - 1}:#{coordinates.x}"] = map["#{coordinates.y - 1}:#{coordinates.x}"] # top
  
  # diagonals - from [here](https://todd.ginsberg.com/post/advent-of-code/2021/day11/)

  neighbours["#{coordinates.y - 1}:#{coordinates.x - 1}"] = map["#{coordinates.y - 1}:#{coordinates.x - 1}"] # right
  neighbours["#{coordinates.y + 1}:#{coordinates.x + 1}"] = map["#{coordinates.y + 1}:#{coordinates.x + 1}"] # down
  neighbours["#{coordinates.y - 1}:#{coordinates.x + 1}"] = map["#{coordinates.y - 1}:#{coordinates.x + 1}"] # left
  neighbours["#{coordinates.y + 1}:#{coordinates.x - 1}"] = map["#{coordinates.y + 1}:#{coordinates.x - 1}"] # top

  neighbours.select { |_, energy| energy != nil}
end

# ledger = setup(coordinates)

# During a single step, the following occurs:

# - First, the energy level of each octopus increases by 1.
# - Then, any octopus with an energy level greater than 9 flashes. 
#   This increases the energy level of all adjacent octopuses by 1, including octopuses that are diagonally adjacent. 
#   If this causes an octopus to have an energy level greater than 9, it also flashes. 
#   This process continues as long as new octopuses keep having their energy level increased beyond 9. 
#   (An octopus can only flash at most once per step.)
# - Finally, any octopus that flashed during this step has its energy level set to 0, as it used all of its energy to flash.

def count_flashes(map, steps)
  flashes = 0


# octopi.each do |octupus|
#   octopus += 1
#   if octopus > 9
#     neighbours = all_neighbours += 1 # 8 around
#     flash 
#     record flashing

#     neighbours.each do |neighbour|
#       neighbours = all_neighbours += 1 # 8 around
#       flash 
#       record flashing
#     end
#   end
# end

  steps.times do |i|
    # p "step #{i}"
    map.transform_values! { |energy| energy += 1 }

    # p map if i == 0

    binding.pry 
    
    flashed = map.select { |_, energy| energy > 9 } # val flashersThisRound = cave.filterValues { it > 9 }.keys
    # p "flashed naturally #{flashed.count}"

    flashed.each do |coords, _| 
      map[coords] = 0 # flashersThisRound.forEach { cave[it] = 0 }
      flash(coords, map, flashed)

      # p map
      # p map.values.count  { |energy| energy == 0 }
    end

    flashes += map.values.count { |energy| energy == 0 }
  end

  flashes
end

# def flash(H, flashed): 
#   flashing = [p for p, val in H.items() if val > 9 and p not in flashed]    
#   if flashing: 
#       for p in flashing: 
#           H.update({q: H[q] + 1 for q in neighborhood(*p) if q in H.keys()}) 
#       flash(H, flashing + flashed)

def flash(coords, map, flashed)
  # p "flashed"
  # p flashed
  binding.pry
  y = coords.split(':').first.to_i
  x = coords.split(':').last.to_i

  octopus_neighbours = neighbours(Coordinate.new(x, y), map) # .flatMap { it.allNeighbors() }

  to_flash = octopus_neighbours.select { |_, energy| energy > 0 } # filter cave[it] != 0
  
  binding.pry  
  
  to_flash.each do |coords, energy| 
    map[coords] = energy += 1 # forEach { cave[it] = cave.getValue(it) + 1 }
    if map[coords] > 9 && !flashed.keys.include?(coords)
      map[coords] = 0 
      flash(coords, map, flashed.merge({coords => energy}))
    end
  end
end

# p count_flashes(coordinates, 99)

  # 4907 is too high
  # 4869 is too high
  # 1866 is too high
  # 1846 in not too high nor too small (99)

# how many flashes?
