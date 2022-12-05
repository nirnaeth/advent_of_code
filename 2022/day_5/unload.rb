# https://adventofcode.com/2022/day/5

# After the rearrangement procedure completes, what crate ends up on top of each stack?
require 'set'

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_5/input.txt"

arrangement, sequence = Input.new(path).to_str_array("\n\n")

#     [D]    
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 
#
# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2

def moves(sequence)
  [].tap do |a|
    sequence.split("\n").each do |move|
      elements = move.split(" ")
      a << { moves: elements[1].to_i, from: elements[3].to_i, to: elements[5].to_i }
    end
  end
end