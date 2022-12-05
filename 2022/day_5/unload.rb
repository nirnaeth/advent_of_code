# https://adventofcode.com/2022/day/5

# After the rearrangement procedure completes, what crate ends up on top of each stack?
require 'set'

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_5/input.txt"

drawing, sequence = Input.new(path).to_str_array("\n\n")

#     [D]    
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 
#
# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2

def arrangement(drawing)
  rows = drawing.split("\n").map(&:chars)

  columns = rows.pop
  rows.reverse!
  
  [].tap do |a|
    columns.each_with_index do |item, index|
      next unless item =~ /[1-9]+/

      a[item.to_i] = [].tap do |b|
        rows.each do |row| 
          next unless row[index] =~ /[A-Z]+/
          b << row[index] 
        end
      end
    end
  end
end

def moves(sequence)
  [].tap do |a|
    sequence.split("\n").each do |move|
      elements = move.split(" ")
      a << { moves: elements[1].to_i, from: elements[3].to_i, to: elements[5].to_i }
    end
  end
end

def move(arrangement, instruction) 
  size = instruction[:moves]

  crates = arrangement[instruction[:from]].pop(size).reverse
  arrangement[instruction[:to]] = arrangement[instruction[:to]] + crates
  
  arrangement
end

def top_crates(drawing, sequence)
  instructions = moves(sequence)
  setup = arrangement(drawing)

  instructions.each do |instruction|
    setup = move(setup, instruction)
  end  

  setup = setup.drop(1)
  
  setup.map(&:pop).join
end

p top_crates(drawing, sequence)