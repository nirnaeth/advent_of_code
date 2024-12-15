# https://adventofcode.com/2024/day/1

$LOAD_PATH << './lib'
require "input.rb"
path = "day_1/data/input.txt"
distances = Input.new(path).to_pairs_array("\n")

def lists(distances)
  distances
    .transpose
    .map(&:sort)
end

# p max(stashes)

def calculate_distance(left_list, right_list)
  distance = 0
  left_list.size.times do |n|
    distance += (left_list[n] - right_list[n]).abs
  end

  distance
end

inputs = lists(distances)
p calculate_distance(inputs.first, inputs.last)
