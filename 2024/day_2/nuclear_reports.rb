# https://adventofcode.com/2024/day/2

$LOAD_PATH << './lib'
require "input.rb"
path = "day_2/data/input.txt"
reports = Input.new(path).to_pairs_array("\n")
