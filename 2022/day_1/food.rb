# https://adventofcode.com/2022/day/1

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_1/input.txt"
stashes = Input.new(path).to_str_array("\n\n")

def max(stashes)
  stashes
    .map { |stash| stash.split("\n").map(&:to_i).sum }
    .max
end

# p max(stashes)

def top_three(stashes)
  stashes
    .map { |stash| stash.split("\n").map(&:to_i).sum }
    .sort_by { |calories| -calories }
    .take(3)
    .sum
end

# p top_three(stashes)