# https://adventofcode.com/2022/day/1

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_1/input.txt"
stashes = Input.new(path).to_str_array("\n\n")

def max_calories(stashes)
  stashes.map { |stash| stash.split("\n").map(&:to_i).sum }.max
end

# p max_calories(stashes)

# def count_depth_increases_in_triples(measures)
#   []
#     .tap { |a| measures.each_cons(3) { |triple| a << triple.sum } }
#     .each_cons(2)
#     .select { |pair| pair.first < pair.last }
#     .count
# end

# p count_depth_increases_in_triples(measures)