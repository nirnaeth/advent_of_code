# https://adventofcode.com/2021/day/7

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_7/input.txt'
crabs = Input.new(path).to_int_array(',')

def blast_position(crabs)
  crabs = crabs.sort

  odd = proc(&:odd?)
  even = proc(&:even?)

  location = case crabs.size
  when odd
    # 1-dimension median (n + 1) / 2
    # index accounting for array offset
    crabs[(crabs.size)] / 2
  when even
    # 1-dimension median (
    #  (n / 2) + 
    #  (n / 2) + 1)
    # ) / 2
    # index accounting for array offset
    index = (crabs.size / 2) - 1 
    (crabs[index] + crabs[(index + 1)]) / 2
  end
end

position = blast_position(crabs)

def calculate_fuel(crabs, position)
  [].tap do |distances|
    crabs.each do |crab|
      distances << (crab - position).abs
    end
  end.sum
end

p calculate_fuel(crabs, position)
