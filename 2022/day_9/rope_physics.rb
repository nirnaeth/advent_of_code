# https://adventofcode.com/2022/day/9

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_9/input.txt"
instructions = Input.new(path).to_str_array

Point = Struct.new("Point", :x, :y,)

def touching?(head, tail)
  (head.x - tail.x).abs <= 1 &&
  (head.y - tail.y).abs <= 1 
end

def move(instruction, head, tail)
  direction, steps = instruction.split(" ")
  steps = steps.to_i
    
  case direction
  when "R" 
    head.x += steps
    
    if !touching?(head, tail) 
      if head.x != tail.x && head.y == tail.y # same row, different column
        tail.x = head.x - 1
      end
    end
    
    { 
      head: [head.x, head.y],
      tail: [tail.x, tail.y]
    }
  when "U"
    head.y += steps

    [head.x, head.y + steps]
  when "L"
    [head.x - steps, head.y]
  when "D"
    [head.x, head.y - steps]
  end
end