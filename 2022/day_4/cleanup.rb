# https://adventofcode.com/2022/day/4

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
  response = first.cover?(second) || second.cover?(first)
end

def overlaps(sections)
  [].tap do |a|
    sections.each do |section| 
      first, second = assignment(section)
      a << [first, second] if full_overlap?(first, second)
    end
  end
  .count
end

p overlaps(sections)