# https://adventofcode.com/2021/day/7

$LOAD_PATH << './lib'
require 'input'
require 'pry'

path = 'support/day_7/input.txt'
crabs = Input.new(path).to_int_array(',')

# https://www.reddit.com/r/adventofcode/comments/rar7ty/2021_day_7_solutions/hnkd58g/?context=3
def blast_position(crabs)
  crabs.sum.to_f / crabs.size.to_f
end

position = blast_position(crabs)

p position

def gaussian_sum(n)
  (n * (n + 1)) / 2
end

def calculate_fuel(crabs, position)
  [].tap do |distances|
    crabs.each do |crab|

      floor = (crab - position.floor).abs
      ceil = (crab - position.ceil).abs

      # have to account for 0.5 variance
      distances << gaussian_sum(position - position.floor > position - position.ceil ? ceil : floor)
    end
  end.sum

end

p calculate_fuel(crabs, position)
