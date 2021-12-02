# https://adventofcode.com/2021/day/2

$LOAD_PATH << './lib'
require "input"
require_relative "part_1/submarine.rb"

path = "support/day_2/input.txt"
list = Input.new(path).to_str_array

submarine = Submarine.new

list.each do |instruction|
  instruction = instruction.split(" ")
  direction = instruction.first.to_sym
  distance = instruction.last.to_i

  submarine.move([direction, distance])
end

p submarine.position.x * submarine.position.y