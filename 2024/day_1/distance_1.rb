# https://adventofcode.com/2024/day/1

$LOAD_PATH << './lib'
require "input.rb"
path = "day_1/data/input.txt"
distances = Input.new(path).to_pairs_array("\n")

def lists(distances)
  distances
    .map { |stash| stash.split("\n").map(&:to_i).sum }
    .max
end

# p max(stashes)

def calculate_distance(left_list, right_list)
  distance = 0
  left_list.size.times do |n|
    distance += (left_list[n] - right_list[n])
  end

  -distance
end

# p calculate_distance(left_list, right_list)
