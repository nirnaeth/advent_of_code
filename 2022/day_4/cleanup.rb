# https://adventofcode.com/2022/day/4
require 'set'

$LOAD_PATH << './lib'
require "input.rb"
path = "data/day_4/input.txt"

sections = Input.new(path).to_str_array

## VISUAL
# .234.....  2-4
# .....678.  6-8

# .23......  2-3
# ...45....  4-5

# ....567..  5-7
# ......789  7-9

# .2345678.  2-8
# ..34567..  3-7

# .....6...  6-6
# ...456...  4-6

# .23456...  2-6
# ...45678.  4-8

def assignment(section)
  first_elf, second_elf = section.split(",")

  return to_range(first_elf.split("-")), to_range(second_elf.split("-"))
end

def to_range(instructions)
  Range.new(instructions.first.to_i, instructions.last.to_i)
end

def full_overlap?(first, second)
  first.cover?(second) || second.cover?(first)
end

def partial_overlap?(first, second)
  first.to_set.intersect? second.to_set
end

def overlaps(sections, full: true)
  sections.inject(0) do |sum, section| 
    first, second = assignment(section)

    sum += 1 if (full && full_overlap?(first, second)) || (!full && partial_overlap?(first, second))
       
    sum
  end

  ## First solution
  # [].tap do |a|
  #   sections.each do |section| 
      
  #     if full
  #       a << [first, second] if full_overlap?(first, second)
  #     else
  #       a << [first, second] if partial_overlap?(first, second)
  #     end  
  #   end
  # end
  # .count
end

p overlaps(sections)
p overlaps(sections, full: false)