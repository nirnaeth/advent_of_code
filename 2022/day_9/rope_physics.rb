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
      elsif head.x == head.y && tail.x != tail.y # same column, different row

      else
        tail.x = head.x - 1
        tail.y = head.y
      end
    end
    
    { 
      head: [head.x, head.y],
      tail: [tail.x, tail.y]
    }
  when "U"
    head.y += steps

    if !touching?(head, tail) 

      if head.x == head.y && tail.x != tail.y # same column, different row
        tail.x = head.x
        tail.y = head.y - 1
      end
    end

    { 
      head: [head.x, head.y],
      tail: [tail.x, tail.y]
    }
  when "L"
    head.x -= steps

    if !touching?(head, tail)

      if head.x != tail.x && head.y == tail.y # same row, different column

      elsif head.x == head.y && tail.x != tail.y # same column, different row
      
      else # diagonal
        tail.x = head.x + 1
        tail.y = head.y
      end
    end
    
    { 
      head: [head.x, head.y],
      tail: [tail.x, tail.y]
    }
  when "D"
    head.y -= steps

    if !touching?(head, tail)

    end

    { 
      head: [head.x, head.y],
      tail: [tail.x, tail.y]
    }
  end
end

def tail_positions(instructions)
  head = Point.new(0, 0)
  tail = Point.new(0, 0)

  instructions.each do |i|
    new_points = move(i, head, tail)
    head = Point.new(new_points[:head].first, new_points[:head].last)
    tail = Point.new(new_points[:tail].first, new_points[:tail].last)
  end

  TODO: operations are correct on the input
  need to record visited positions by tail

  return {head: head, tail: tail }
end

# Last 
# ......
# ......
# .TH...
# ......
# s.....

p tail_positions(instructions)