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

def setup(coords)
  [].tap do |ledger|
    (0..9).each do |energy_level|
      ledger[energy_level] = [] if ledger[energy_level].nil?
      same_level = coords.select { |_, v| v == energy_level }
      ledger[energy_level] << same_level if same_level.any?
    end
  end
end


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

# how many flashes?
