# https://adventofcode.com/2022/day/6

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_6/input.txt"
transmission = Input.new(path).to_str_array

def packet_start?(sequence)
  current = sequence.shift
  !sequence.include? current
end
