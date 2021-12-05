# https://adventofcode.com/2021/day/5

$LOAD_PATH << './lib'
require 'input'
require 'matrix'
require 'pry'

input_path = File.expand_path(File.dirname(__FILE__) + '/../support/day_5/input.txt')

# read coordinates
# each pair is in the form of x1, y1 -> x2, y2
# we transform each pair in a pair of coordinates
# pair: 0,9 -> 5,9 
# start: [0, 9]
# finish: [5, 9]
def read_coordinates(pair)
  start, finish = pair.split('->').map(&:strip)
  start = start.split(',').map(&:to_i)
  finish = finish.split(',').map(&:to_i)

  return start, finish
end

def lines_from_coordinates(input_path)
  file = File.new(input_path, 'r')

  pairs = file.read.split("\n")
  [].tap do |lines|
    pairs.each do |pair|
      start, finish = read_coordinates(pair)

      # we transform each pair in a line like
      # start: [0, 9]
      # finish: [5,9]
      # line: [[0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9]]

      negative = proc(&:negative?)
      positive = proc(&:positive?)
      horizontal_distance = start.first - finish.first
      vertical_distance = start.last - finish.last

      xs = case horizontal_distance
      when negative
        # example
        # pair: 0,9 -> 5,9
        # 0 - 5 = -5
        # we want the line xs to be going up
        # 0, 1, 2...
        (start.first..finish.first).to_a
      when positive
        # example
        # pair: 6,4 -> 2,0
        # 6 - 2 = 4
        # we want the line xs to go down
        # 6, 5, 4...
        (start.first..finish.first).step(-1).to_a
      else
        # if one of the two dimensions is just horizontal or vertial, we need to create
        # an array ad hoc with the same element repeating
        # the size of the array has to be offset by 1 because of the 0 index
        Array.new(vertical_distance.abs + 1, finish.first)
      end     

      ys = case vertical_distance
      when negative
        # example
        # pair: 8,0 -> 0,8
        # 0 - 8 = -8
        # we want the line ys to be going up
        # 0, 1, 2...
        (start.last..finish.last).to_a
      when positive
        # example
        # pair: 2,2 -> 2,1
        # 2 - 1 = 1
        # we want the line ys to go down
        # 2, 1
        (start.last..finish.last).step(-1).to_a
      else
        Array.new(horizontal_distance.abs + 1, finish.last)
      end

      lines << xs.zip(ys)
    end
  end
end

def calculate_max(lines)
  max = 0
  
  lines.each do |points|
    local_max = points.first.first > points.last.first ? points.first.first : points.last.first
    
    max = local_max if local_max > max
  end

  # for the love of me I have no idea why the offset is +2 for x
  max += 2
end

def fill_diagram(lines, no_diagonals = true)
  max = calculate_max(lines)

  # set everything up with zeros
  diagram = [].tap { |diagram| max.times { |n| diagram << Array.new(max, 0)} }

  lines.each do |points|
    is_vertical = points.first.first == points.last.first
    is_horizontal = points.first.last == points.last.last

    points.each do |point|
      case no_diagonals
      when true
        diagram[point.last][point.first] += 1 if (is_vertical || is_horizontal)
      when false
        diagram[point.last][point.first] += 1
      end
    end
  end

  diagram
end

def overlapping_lines(diagram)
  0.tap do |sum| 
    diagram.each do |lines|
      sum += lines.count { |element| element > 1 }
    end

    p sum
  end
end

lines = lines_from_coordinates(input_path)
# -----------------------------------------------------------------------------------
# part 1
# -----------------------------------------------------------------------------------
diagram = fill_diagram(lines)

overlapping_lines(diagram)
# -----------------------------------------------------------------------------------
# part 2
# -----------------------------------------------------------------------------------
diagram = fill_diagram(lines, false)

overlapping_lines(diagram)