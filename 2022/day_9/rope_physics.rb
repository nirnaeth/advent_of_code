# https://adventofcode.com/2022/day/9

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_9/input.txt"
moves = Input.new(path).to_str_array

Point = Struct.new("Point", :x, :y,)

def touching?(head, tail)
  # binding.pry
  (head.x - tail.x).abs <= 1 ||
  (head.y - tail.y).abs <= 1
end