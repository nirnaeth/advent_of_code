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