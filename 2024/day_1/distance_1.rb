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

def calculate_distance(left_list, right_list)
  [].tap do |a|
    left_list.each_with_index do |_, index|
      a << (left_list[index] - right_list[index]).abs
    end
  end.sum
end

inputs = lists(distances)
# p calculate_distance(inputs.first, inputs.last)

def calculate_similarity(left_list, right_list)
  [].tap do |a|
    left_list.each do |n|
      a << (n * right_list.count(n))
    end
  end.sum
end

p calculate_similarity(inputs.first, inputs.last)
