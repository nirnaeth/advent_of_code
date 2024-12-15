# https://adventofcode.com/2024/day/2

$LOAD_PATH << './lib'
require "input.rb"
path = "day_2/data/input.txt"
reports = Input.new(path).to_int_matrix("\n")

def is_safe?(report)
  # this fails no matter what when the array is decreasing
  return false if report != report.sort
end
